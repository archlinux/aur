# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=zddccpl-git
pkgver=r1
pkgrel=1
pkgdesc="Qt gui to adjust display settings through DDC/CI"
arch=('x86_64')
url="https://codeberg.org/zynskeyfolf/zddccpl"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'ddcutil')
makedepends=('git' 'cmake' 'make' 'qt5-base' 'ddcutil')
source=("git+https://codeberg.org/zynskeyfolf/zddccpl")
sha256sums=(SKIP)

build() {
	mkdir "zddccpl/build"
	cd "zddccpl/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make
}

package() {
	cd "zddccpl/build"
	make install
}
