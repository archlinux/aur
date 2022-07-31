# Maintainer: Jeremy Plsek <jeremy plsek at googlemail dot com>
pkgname=puush-qt
pkgdesc="GUI frontend for puush which will create a system tray icon."
pkgver=0.2.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jplsek/puush-qt"
license=('BSD')
source=('git+https://github.com/jplsek/puush-qt.git')
md5sums=('SKIP')
makedepends=('git' 'cmake')
depends=('scrot' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2')

build() {
	cd "$pkgname"
	git submodule init
	git submodule update
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}

