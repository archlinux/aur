# Maintainer: rebel <novakpetya at yahoo dot co dot uk>

pkgname=qt5pas-lazarus
pkgver=2.6
pkgrel=1
pkgdesc="Free Pascal Qt5 binding library modified for Lazarus IDE"
arch=(x86_64)
url=http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html
license=(LGPL3)
depends=(qt5-base qt5-x11extras qt5-webkit)
makedepends=(subversion)
conflicts=(qt5pas)
source=("$pkgname::svn+https://svn.freepascal.org/svn/lazarus/trunk/lcl/interfaces/qt5/cbindings")

build() {
	cd $pkgname
	qmake-qt5 "QT += x11extras"
	make
}

package() {
	cd $pkgname
	make INSTALL_ROOT=$pkgdir install
}
sha256sums=('SKIP')
