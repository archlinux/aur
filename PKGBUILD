pkgname=skwd-lens-model
pkgver=1.0.0
pkgrel=2
pkgdesc='Default SigLIP 2 semantic model pack for Skwd Lens'
arch=(x86_64)
url='https://github.com/liixini/skwd-lens'
license=(Apache-2.0 CC-BY-4.0 MIT)
depends=(gcc-libs glibc)
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.xz::https://github.com/liixini/skwd-lens-model/releases/download/v1.0.0/skwd-lens-model-1.0.0.tar.xz")
sha256sums=('fcaabfe14ed4ce26eb50662f8155420439834f30313a80d41edb516ca2e2a0da')

package() {
  install -d "$pkgdir/usr/share/skwd-lens/models"
  cp -a "$srcdir/$pkgname-$pkgver/semantic" "$pkgdir/usr/share/skwd-lens/models/semantic"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver/licenses/"*.txt \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
