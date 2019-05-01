# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: garion < garion @ mailoo.org >
# Contributor: leemars

pkgname=ibus-qt
pkgver=1.3.3
pkgrel=13
pkgdesc='IBus qt library and IBus qt input method plugin'
arch=('x86_64')
license=('LGPL')
url='http://ibus.googlecode.com'
depends=('qt4' 'ibus' 'icu')
makedepends=('cmake' 'doxygen' 'git')
source=("git+https://github.com/ibus/ibus-qt.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname

  make DESTDIR="${pkgdir}" install
}

