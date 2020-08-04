# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.8.0
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
		"$_src_base_url/$_models_name.scorer"
		"$_src_base_url/$_models_name.tflite")
sha512sums=('b2b5affdfaf962e1438302481b07bbc4b0433e1a59ec921dc5ddba714b859dc16a496fe50d8edb80711f73a5da91e1991dda270d353e8c93b9d26596a347e091'
			'ce350f9f4d6562e792a2488926d725293d4756d70fd679513b96370f3e3bbd7953c53a1f06c6a5a5f03911f2b081ff0439756c0ba1f917808eba4781b9b7bf47'
			'2dff7bdb1f6f3b04a11a542bf850c13ac635c2ae141ee94661b3d56928c5f871760107d3d35afec62688921b29f665c81e0a17f18d7234fe72c2b86a4473ab44')

_install() {
	install -Dm 444 "$_models_name.$1" "$pkgdir/usr/share/mozilla/deepspeech/models/ds-model.$1"
}

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    _install pbmm
    _install tflite
    _install scorer
}
