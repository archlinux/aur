# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: x11
pkgname=hfp
pkgver=0.5.0
pkgrel=0
pkgdesc="Hoerfahrplanprogramm"
license="GPL"
depends=(qt)
url="http://www.bwalle.de"
arch=(i686 x86_64)
source=(http://www.bwalle.de/programme/hfp/$pkgname-$pkgver.tar.bz2)
md5sums=('772eea223bce3e2b3fe36ea583462f6e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make || return 1
  make DESTDIR=$pkgdir install
}
