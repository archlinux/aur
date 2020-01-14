# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.6.1
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - models and supporting files."
arch=('any')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
provides=('deepspeech-models')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_tarball_path="deepspeech-$pkgver-models"
source=("$_src_base_url/$_tarball_path.tar.gz")
sha512sums=('4f8d2930b5566adca982b58f9abc4e101854a0d695ef3057153906bb6db0b31fa2f04ff1a4781b63be1d6bfe6645ac906f5909e2f808be95825a1fa4b7a6938f')

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    install -Dm 444 "$_tarball_path/output_graph.pbmm" "$_tarball_path/lm.binary" "$_tarball_path/trie" "$pkgdir/usr/share/mozilla/deepspeech/models"
}
