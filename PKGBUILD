# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=libxeddsa
pkgver=2.0.0
pkgrel=2
pkgdesc='A toolkit around Curve25519 and Ed25519 key pairs.'
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('git' 'cmake' 'libsodium')
source=("${pkgname}.zip::https://github.com/Syndace/libxeddsa/archive/refs/tags/v${pkgver}.zip")
sha256sums=('6b56e30c0185560727dc65785da3142d2008331c68a0361467b638cddf7e3302')
depends=('glibc')

prepare() {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
