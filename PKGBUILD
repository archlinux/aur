# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=rofi-calc
pkgver=0.1
pkgrel=1
pkgdesc="Do calculations in rofi"
arch=('x86_64')
url="https://github.com/svenstaro/rofi-calc"
license=(MIT)
depends=(rofi libqalculate)
source=(https://github.com/svenstaro/rofi-calc/archive/v${pkgver}.tar.gz)
sha512sums=('ecaf1557df2873a75cd3af9ccd9ecf04604ca4e2cd0848df951ae15ab655bd0c8642fffb993471003f3cc94f507a216f0d81d64d898801746128812bfc3d1c6c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i
  rm -rf build
  mkdir build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
