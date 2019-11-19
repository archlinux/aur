# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theslate
pkgver=1.0
pkgrel=0
pkgdesc="Text Editor with code highlighting support"
arch=("x86_64")
url="https://github.com/vicr123/theslate"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'qt5-webengine' 'qt5-svg' 'syntax-highlighting')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theSlate.git')
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	git checkout tags/v$pkgver
	git submodule init
	git submodule update
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
