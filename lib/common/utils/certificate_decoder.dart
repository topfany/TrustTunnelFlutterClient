import 'dart:convert';
import 'dart:typed_data';

class RawCertificateDecoder extends Converter<Uint8List, String> {
  const RawCertificateDecoder();

  @override
  String convert(Uint8List input) {
    final text = _tryUtf8(input);

    if (text != null) {
      return text;
    }

    return base64Encode(input);
  }

  String? _tryUtf8(Uint8List bytes) {
    try {
      return utf8.decode(bytes, allowMalformed: false);
    } catch (_) {
      return null;
    }
  }
}
