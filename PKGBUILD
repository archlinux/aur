# Maintainer: Benjamin Brown <brown.benjam@northeastern.edu>
pkgname=deepspeech-models
pkgver=0.7.4
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - models and supporting files."
arch=('any')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
provides=('deepspeech-models')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_models_name="deepspeech-$pkgver-models"
source=("$_src_base_url/$_models_name.pbmm"
		"$_src_base_url/$_models_name.tflite"
		"$_src_base_url/$_models_name.scorer")
sha512sums=('72a7de3c60de511cd32c252f8650d0c7bc0b5da7c8a7bfa8eb5d1911f88c4195c789bffe4b688bf59696f2a52317a1405b7ac568d2078fb891f6b2e4f451213d'
			'bb39a5474b79b004d090be14ff8b13099593e11fed40667cc074a567810d0e6d8db4705718a939b2100cf822019eb862d67b6833e9abec7aa86b243a11aa6a59'
			'ce350f9f4d6562e792a2488926d725293d4756d70fd679513b96370f3e3bbd7953c53a1f06c6a5a5f03911f2b081ff0439756c0ba1f917808eba4781b9b7bf47')

_install() {
	install -Dm 444 "$_models_name.$1" "$pkgdir/usr/share/mozilla/deepspeech/models/ds-model.$1"
}

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    _install pbmm
    _install tflite
    _install scorer
}
