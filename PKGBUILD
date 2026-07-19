pkgname=libxdo3
pkgver=3.20211022.1
pkgrel=1
pkgdesc="Keyboard input simulation library (v3)"
arch=('x86_64')
url="https://github.com/jordansissel/xdotool"
license=('BSD-3-Clause')
depends=('libx11' 'libxtst' 'libxinerama' 'libxkbcommon')
provides=('libxdo')
source=("xdotool-$pkgver.tar.gz::https://github.com/jordansissel/xdotool/releases/download/v$pkgver/xdotool-$pkgver.tar.gz")
sha256sums=('96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada')

build() {
  make -C "xdotool-$pkgver" WITHOUT_RPATH_FIX=1 libxdo.so libxdo.so.3
}

package() {
  cd "xdotool-$pkgver"

  install -Dm644 libxdo.so.3 "$pkgdir/usr/lib/libxdo.so.3"

  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
