# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.21.0
pkgrel=1
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6493ebcfb1772458db4ca66da4c5536968484a3815cf75d2bb33c600b4471910')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
