# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-piper-voice-ru-ruslan
_model=vits-piper-ru_RU-ruslan-medium
pkgver=20251202
pkgrel=2
pkgdesc="Russian Piper TTS voice ruslan (medium quality) in sherpa-onnx format"
arch=('any')
url="https://github.com/k2-fsa/sherpa-onnx/releases/tag/tts-models"
license=('CC-BY-NC-SA-4.0')
optdepends=('sherpa-onnx: TTS engine that loads this voice')
# The download URL carries no version; the local name does, so a re-upload upstream never collides with a cached copy
source=("${_model}-${pkgver}.tar.bz2::https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/${_model}.tar.bz2")
sha256sums=('0690b1cad01f86e8db9ba988af24898bdc1af774e23cb2e46b9c730269b6fd83')

package() {
  install -d "${pkgdir}/usr/share/sherpa-onnx"
  cp -r --no-preserve=ownership "${_model}" "${pkgdir}/usr/share/sherpa-onnx/"
}
