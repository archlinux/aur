# Maintainer: Jeremy Plsek <jeremy plsek at googlemail dot com>
pkgname=puush-qt
pkgdesc="GUI frontend for puush which will create a system tray icon."
pkgver=0.1
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/jplsek/puush-qt"
license=('BSD')
source=('git+https://github.com/jplsek/puush-qt.git')
md5sums=('SKIP')
makedepends=('git')
depends=('scrot' 'curl' 'qt5-base')

prepare() {
	mkdir $pkgname/build
}

build() {
	cd $pkgname/build
	qmake PREFIX=/usr ../src/puush-qt.pro
	make
}

package() {
	cd $pkgname/build
	make INSTALL_ROOT=$pkgdir install
}

