# Maintainer: Jeremy Plsek <jeremy plsek at googlemail dot com>
pkgname=puush-qt
pkgdesc="GUI frontend for puush which will create a system tray icon."
pkgver=0.2.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jplsek/puush-qt"
license=('BSD')
source=('git+https://github.com/jplsek/puush-qt.git')
md5sums=('SKIP')
makedepends=('git')
depends=('scrot' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2')

build() {
	cd "$pkgname"
	git submodule init
	git submodule update
	qmake PREFIX=/usr puush-qt.pro
	make
}

package() {
	cd "$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}

