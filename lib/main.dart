import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 07 - Login',
      theme: ThemeData(
        primaryColor: Colors.blue,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const LoginForm(title: 'LoginForm'),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.title});

  final String title;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  int _counter = 0;

  void _checklogin() {
    String user = _userController.text.trim();
    String pass = _passController.text.trim();
    if (user.isEmpty || pass.isEmpty) {
      _showDialog("Thông báo", "Vui lòng nhập thông tin đầy đủ!");
      return;
    }
    if (user.length < 3) {
      _showDialog("Lỗi", "Tên đăng nhập ít nhất 3 kí tự!", isError: true);
      return;
    }
    if (pass.length < 6) {
      _showDialog("Lỗi", "Mật khẩu ít nhất 6 kí tự", isError: true);
      return;
    }
    if (user == "tranvu" && pass == "123456") {
      _showDialog("Thành công", "Đăng nhập thành công!", isError: true);
    } else {
      _showDialog("Lỗi", "Sai tài khoản hoặc mật khẩu!", isError: true);
    }
  }

  void _resetForm() {
    _userController.clear();
    _passController.clear();
  }

  void _showDialog(
    String title,
    String message, {
    bool isSuccess = false,
    bool isError = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: isError
                ? Colors.red
                : (isError ? Colors.green : Colors.black),
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập hệ thống"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: "Tên đăng nhập",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mật khẩu",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _checklogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Đăng nhập"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _resetForm,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text("Làm mới"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
