# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.21.1
pkgrel=1
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('aecc9f55eb35a00a2490e9a7536a0babf8ac86bb13d32a4a95e1216f9f5cbfa8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
