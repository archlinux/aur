# Contributor: Krzysiek Wojszko <w.krzysiek@gmail.com>
# Contributor: Firmicus <firmicus ? gmx ? net>
# Maintainer: Xyne <ca dot archlinux at xyne, backwards>

pkgname=gonvert
pkgver=0.2.34
pkgrel=1
pkgdesc="unit conversion utility with 51 categories and 972 units"
url="http://www.unihedron.com/projects/gonvert/index.php"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2' 'python2' 'pygtk')
install=
source=(http://www.unihedron.com/projects/gonvert/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('deed2542bed898f1202b6e9a55f7bbd27714ffb94985c0cdf034823bfb2832f4')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@prefix *= /usr/local@prefix = /usr@g' Makefile
  sed -i 's@/usr/bin/python@/usr/bin/env python2@' gonvert
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
