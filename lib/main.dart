import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  AudioPlayer audioPlayer = AudioPlayer();

  void playSound(int songNumber) {
    audioPlayer.play(AssetSource('note$songNumber.wav'));
  }

  Expanded songButton(
      {required Color color,
      required String songName,
      required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          'Play $songName',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Xylophone'),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              songButton(color: Colors.amber, soundNumber: 1, songName: 'Tong'),
              songButton(color: Colors.red, soundNumber: 2, songName: 'Ting'),
              songButton(
                  color: Colors.blue, soundNumber: 3, songName: 'Ting lite'),
              songButton(
                  color: Colors.orange, soundNumber: 4, songName: 'Ting large'),
              songButton(
                  color: Colors.pink, soundNumber: 5, songName: 'Ting soft'),
              songButton(
                  color: Colors.blueGrey, soundNumber: 6, songName: 'Tine'),
            ],
          ),
        ),
      ),
    );
  }
}
