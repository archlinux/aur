pkgname=deepspeech-models-zh-cn
pkgver=0.9.3
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - models and supporting files."
arch=('any')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
provides=('deepspeech-models')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_models_name="deepspeech-$pkgver-models"
source=(
  "$_src_base_url/$_models_name-zh-CN.pbmm"
  "$_src_base_url/$_models_name-zh-CN.scorer"
  "$_src_base_url/$_models_name-zh-CN.tflite"
)
sha256sums=(
  '7d04351d5526290aa1d18195f92d7f5eb84c0eeab437c804dd241c67df3d3dd1'
  '2687d968f46189504d9b9edc0f914f6b4b39c4d94c73f75b6a6c180d33f30240'
  'dbd3461aaba5f320b71f3c53e49a0924afb8a8eb383364f07dfb8cc51364e396'
)

_install() {
  install -Dm 444 "$_models_name-zh-CN.$1" "$pkgdir/usr/share/mozilla/deepspeech/models/ds-model-zh-cn.$1"
}

package() {
  mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
  _install pbmm
  _install tflite
  _install scorer
}
