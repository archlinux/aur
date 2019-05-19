# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.4.1
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - models and supporting files."
arch=('any')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
provides=('deepspeech-models')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
source=("$_src_base_url/deepspeech-$pkgver-models.tar.gz")
sha512sums=('804e97c22f83beefca9e54056f1c6d55499440171fd6cf7737b83895a847ede5bbd3d65dd196280d15ac239259573757069d209401478cd2f6eddbbeff4aaf35')

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    install -Dm 444 "models/output_graph.pbmm" "models/alphabet.txt" "models/lm.binary" "models/trie" "$pkgdir/usr/share/mozilla/deepspeech/models"
}
