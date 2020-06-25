# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.18.1
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://arblib.org/"
license=(LGPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('9c5c6128c2e7bdc6e7e8d212f2b301068b87b956e1a238fe3b8d69d10175ceec')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
