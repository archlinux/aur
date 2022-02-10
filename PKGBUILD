# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thefile
pkgver=4.0.2
pkgrel=0
pkgdesc="File Manager"
arch=("x86_64")
url="https://github.com/vicr123/thefile"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'libtdesktopenvironment' 'libthefrisbee' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/vicr123/thefile#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd thefile
	mkdir -p build
	cd build
	qmake ../theFile.pro
	make
}

package() {
	cd thefile/build
	make install INSTALL_ROOT=$pkgdir
}
