# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=kdesudo
pkgver=3.4.2.4
pkgrel=1
pkgdesc="A SUdo frontend for KDE"
arch=("i686" "x86_64")
url="https://launchpad.net/kdesudo"
license=("GPL")
depends=("kdebase-runtime" "sudo")
makedepends=("cmake" "automoc4")
options=(!emptydirs)
source=(http://launchpad.net/${pkgname}/3.x/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	# Config
	sed -i "s|ADD_SUBDIRECTORY(en)|#ADD_SUBDIRECTORY(en)|g" doc/CMakeLists.txt

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install
}

sha1sums=('4821552c6ce32e9ce92bc054a1963a1e96bf5185')
