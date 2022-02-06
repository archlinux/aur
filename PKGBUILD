# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thefile
pkgver=4.0
pkgrel=0
pkgdesc="File Manager"
arch=("x86_64")
url="https://github.com/vicr123/thefile"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'libtdesktopenvironment' 'libthefrisbee' 'qt5-svg')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/thefile/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('214f4751b8d194adaa25f06176849242ade9539352672655cdf5071d240b17fa')

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
