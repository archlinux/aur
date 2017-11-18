# $Id: PKGBUILD 252466 2015-12-05 16:35:01Z fyan $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=xbase
pkgver=3.2.0
pkgrel=4
pkgdesc="A C++ library"
arch=('i686' 'x86_64')
url='https://github.com/graywolf/xbase'
license=('LGPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
options=(staticlibs)

source=("git+https://github.com/graywolf/xbase#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
	cd "${pkgname}"
	mkdir -p build
}

build() {
	cd "${pkgname}/build"

	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}" \
		..
	make
}

#check() {
#}

package() {
	cd "${pkgname}/build"
	make install
}
