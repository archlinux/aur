# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.5.1
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
sha512sums=('37ad419d9123cc46e62785c3091069f8abf54f3f38529ecca58fc10c679788d7760526019aa6514dbbe87d9bca4661be5eaa3ee2a0693b3b1824c6d70978197c')

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    install -Dm 444 "$_tarball_path/output_graph.pbmm" "$_tarball_path/alphabet.txt" "$_tarball_path/lm.binary" "$_tarball_path/trie" "$pkgdir/usr/share/mozilla/deepspeech/models"
}
