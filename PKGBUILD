# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theterminal-blueprint
pkgver=3.0b
pkgrel=0
pkgdesc="Simple Terminal Emulator"
arch=("x86_64")
url="https://github.com/vicr123/theterminal"
license=('GPL3')
depends=('xdg-utils' 'tttermwidget' 'qt5-base' 'qt5-x11extras' 'the-libs')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theterminal#branch=blueprint')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake "CONFIG+=blueprint" theterminal.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
