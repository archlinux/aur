# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-piper-voice-ru-denis
_model=vits-piper-ru_RU-denis-medium
pkgver=20251202
pkgrel=2
pkgdesc="Russian Piper TTS voice denis (medium quality) in sherpa-onnx format"
arch=('any')
url="https://github.com/k2-fsa/sherpa-onnx/releases/tag/tts-models"
license=('CC0-1.0')
optdepends=('sherpa-onnx: TTS engine that loads this voice')
# The download URL carries no version; the local name does, so a re-upload upstream never collides with a cached copy
source=("${_model}-${pkgver}.tar.bz2::https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/${_model}.tar.bz2")
sha256sums=('efa4c18e0b5e32b81d1b6df36b9d312831e5d545200e27848ef926a4cd930300')

package() {
  install -d "${pkgdir}/usr/share/sherpa-onnx"
  cp -r --no-preserve=ownership "${_model}" "${pkgdir}/usr/share/sherpa-onnx/"
}
