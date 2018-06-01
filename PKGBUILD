# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theslate
pkgver=0.3
pkgrel=0
pkgdesc="Text Editor with code highlighting support"
arch=("x86_64")
url="https://github.com/vicr123/theslate"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'qtermwidget' 'the-libs' 'qt5-websockets' 'qt5-svg')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theslate.git')
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
