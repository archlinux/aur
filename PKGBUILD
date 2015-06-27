# Maintainer: Vincent Prelat <prelatv [at] gmail.com>

pkgname=dg100ctl
pkgver=0.1
pkgrel=2
pkgdesc="Program to configure the GlobalSat DG-100 GPS data logger"
url="http://xpg.dk/projects/dg100ctl"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('cmake')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('07008d7366148c2e1811ca20f8ccd9c4')


build() {
  cd $startdir/src/$pkgname-$pkgver

  mkdir build
  cd build
  cmake -D QT_QMAKE_EXECUTABLE=qmake4 -D CMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

}

