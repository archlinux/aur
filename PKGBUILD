# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.22.1
pkgrel=2
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1ef85518eee04885e8a90196498bc75e4e2410621d4184f2bc01d46b7080a243')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
