# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-typelib
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Typelib)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-utilmm' 'antlr2' 'libxml2')
makedepends=('cmake')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build typelib
	cd "${srcdir}/${_pkgname}-${pkgver}/typelib"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	# install typelib
	cd "${srcdir}/${_pkgname}-${pkgver}/typelib"
	make DESTDIR=${pkgdir} install
}

