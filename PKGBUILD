# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.5.0
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
sha512sums=('5e780fe54e9449a8bb801e957e91656ca026c5989c8e12bdebd7aae83ead7de6178ca897ddbb433c7d55ec548c072a485bffd3d4fcb946ee115c1bcf7d0ac374')

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    install -Dm 444 "$_tarball_path/output_graph.pbmm" "$_tarball_path/alphabet.txt" "$_tarball_path/lm.binary" "$_tarball_path/trie" "$pkgdir/usr/share/mozilla/deepspeech/models"
}
