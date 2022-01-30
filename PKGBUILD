# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=slideextract
pkgver=0.3.0
pkgrel=1
pkgdesc="Extract slides from videos."
arch=('any')
url="http://szanni.org/slideextract"
license=('BSD')
depends=('opencv>=4.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('ef6a304af64c934ab4dff2e63e096c19b8370b1796078241898abc0874a8bbab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
