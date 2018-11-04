# Contributor: Krzysiek Wojszko <w.krzysiek@gmail.com>
# Contributor: Firmicus <firmicus ? gmx ? net>
# Maintainer: Xyne <ca dot archlinux at xyne, backwards>

pkgname=gonvert
pkgver=0.2.39
pkgrel=1
pkgdesc='unit conversion utility with 51 categories and 972 units'
url='http://www.unihedron.com/projects/gonvert/index.php'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'python2' 'pygtk')
install=
source=(http://www.unihedron.com/projects/gonvert/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('013b5b8be7d4af05667bc3689bda021e843e5bb8362d72727076ab77df375de1')


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
