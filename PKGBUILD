# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.3.1
pkgrel=1
pkgdesc="Linux support for Microsoft SideWinder X4 / X6 and Logitech G710+."
arch=('x86_64')
url="http://cevel.net/projects/sidewinderd/"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
md5sums=('8cc5358dc5907cff84db417fc1dc2ccd')

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
