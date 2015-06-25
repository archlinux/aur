# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.2.1
pkgrel=1
pkgdesc="Sidewinder daemon - Linux support for Microsoft Sidewinder X4 / X6 keyboards"
arch=('x86_64')
url="http://cevel.net/projects/sidewinderd/"
depends=('libconfig' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
md5sums=('bb24ea3e7bf9289d21af92468347b4ee')

prepare() {
	mkdir -p build
	cd ${pkgname}-${pkgver}
}

build() {
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		../${pkgname}-${pkgver}
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
