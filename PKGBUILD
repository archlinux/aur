pkgname=skwd-lens-model
pkgver=1.0.0
pkgrel=1
pkgdesc='Default SigLIP 2 semantic model pack for Skwd Lens'
arch=(x86_64)
url='https://github.com/liixini/skwd-lens'
license=(Apache-2.0 CC-BY-4.0 MIT)
depends=(gcc-libs glibc)
options=(!strip !debug)
source=("skwd-lens-model-1.0.0-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/11005810/skwd-lens-model-1.0.0-1.fc44.src.rpm")
sha256sums=('33255a77cc0b3e5ecc89e71e107b65ecf23fa41f6908a5af7022ac370b8b518c')

prepare() {
  bsdtar -xf "$srcdir/skwd-lens-model-1.0.0-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-lens-model-1.0.0.tar.xz" -C "$srcdir"
}

package() {
  install -d "$pkgdir/usr/share/skwd-lens/models"
  cp -a "$srcdir/$pkgname-$pkgver/semantic" "$pkgdir/usr/share/skwd-lens/models/semantic"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver/licenses/"*.txt \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
