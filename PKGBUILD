# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.23.0
pkgrel=1
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('977d41bde46f5442511d5165c705cec32c03e852c84d7d1836135d412ce702bb')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
