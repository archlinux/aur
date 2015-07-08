# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=slideextract
pkgver=0.0.2
pkgrel=2
pkgdesc="Extract slides from videos."
arch=('any')
url="http://szanni.org/slideextract"
license=('BSD')
depends=('opencv>=2.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('1546996a687a476f81e65f5bbedda2ef4c0325b0e32caf4f89757fd15957d1c2')

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
