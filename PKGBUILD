# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theterminal
pkgver=2.1
pkgrel=2
pkgdesc="Simple Terminal Emulator"
arch=("x86_64")
url="https://github.com/vicr123/theterminal"
license=('GPL3')
depends=('xdg-utils' 'qtermwidget' 'qt5-base' 'qt5-x11extras' 'the-libs')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theterminal#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
