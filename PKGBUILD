# Contributor: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
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
  "$_src_base_url/$_models_name.pbmm"
  "$_src_base_url/$_models_name.scorer"
  "$_src_base_url/$_models_name.tflite"
)
sha256sums=(
  'ebe9b4f64bda3591acd723c27629f101d1bb1ec487730d9f882bcfe03214462d'
  'd0cf926ab9cab54a8a7d70003b931b2d62ebd9105ed392d1ec9c840029867799'
  '0a88f98ff15c9bf760bf7da035b9dafae240e7eb000af376f87e052aae331203'
)

_install() {
  install -Dm 444 "$_models_name.$1" "$pkgdir/usr/share/mozilla/deepspeech/models/ds-model.$1"
}

package() {
  mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
  _install pbmm
  _install tflite
  _install scorer
}
