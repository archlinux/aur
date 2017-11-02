# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=slideextract
pkgver=0.0.3
pkgrel=1
pkgdesc="Extract slides from videos."
arch=('any')
url="http://szanni.org/slideextract"
license=('BSD')
depends=('opencv>=2.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('808358e3b37cf4a57a39ced8a716d9b537673a43f4e45e36a94655a00bf15916')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
