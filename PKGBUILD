# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-utilmm
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (C++ toolkit)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('boost')
makedepends=('cmake')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build utilmm
	cd "${srcdir}/${_pkgname}-${pkgver}/utilmm"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	# install utilmm
	cd "${srcdir}/${_pkgname}-${pkgver}/utilmm"
	make DESTDIR=${pkgdir} install
}

