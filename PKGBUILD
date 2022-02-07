# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thefile
pkgver=4.0.1
pkgrel=0
pkgdesc="File Manager"
arch=("x86_64")
url="https://github.com/vicr123/thefile"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'libtdesktopenvironment' 'libthefrisbee' 'qt5-svg')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/thefile/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8184a2ce92d5be72af15b5a09e6c8f1e2f0bc240751afb6d267917374fc36f8')

build() {
	cd "thefile-$pkgver"
	mkdir -p build
	cd build
	qmake ../theFile.pro
	make
}

package() {
	cd "thefile-$pkgver"
	cd build
	make install INSTALL_ROOT=$pkgdir
}
