# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-models
pkgver=0.6.0
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
sha512sums=('4bc7a8abecc6fa16d2f9e84a86e46353831bc0af24bbc88a8b9999a34774699273a128791217ec0d71b98df5a3088fb7e28a1c95eb06302f5591e09de85ebd02')

package() {
    mkdir -p "$pkgdir/usr/share/mozilla/deepspeech/models"
    install -Dm 444 "$_tarball_path/output_graph.pbmm" "$_tarball_path/lm.binary" "$_tarball_path/trie" "$pkgdir/usr/share/mozilla/deepspeech/models"
}
