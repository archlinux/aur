# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.22.0
pkgrel=1
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('3e40ab8cf61c0cd63d5901064d73eaa2d04727bbdc6eebb1727997958a14f24d')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
