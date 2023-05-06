# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=slideextract
pkgver=0.3.1
pkgrel=1
pkgdesc="Extract slides from videos."
arch=('any')
url="http://szanni.org/slideextract"
license=('BSD')
depends=('opencv>=4.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('02662909a6febb93b59d7cc806923cbacc7c67c65722001b27f75102428a5f69')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
