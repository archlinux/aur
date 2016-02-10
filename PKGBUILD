# Maintainer: Ben Iofel <iofelben@gmail.com>

pkgname=cmake-elementary-bzr
pkgver=0.1.0
pkgrel=1
pkgdesc="CMake's elementary modules"
arch=('any')
url="https://code.launchpad.net/~elementary-os/+junk/cmake-modules"
license=('GPL3')
depends=('cmake')
makedepends=('bzr')
source=('bzr+lp:~elementary-os/+junk/cmake-modules')
sha256sums=('SKIP')

prepare() {
        mkdir -p cmake-modules/build
}

build() {
	cd cmake-modules/build
        cmake .. \
            -DCMAKE_BUILD_TYPE='Release' \
            -DCMAKE_INSTALL_PREFIX='/usr'
	make
}

package() {
	cd cmake-modules/build
        make DESTDIR="${pkgdir}" install
}
