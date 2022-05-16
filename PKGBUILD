# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>

pkgname=ass2bdnxml
pkgver=1.04
pkgrel=3
pkgdesc="ASS/SSA to BluRay SUP/PGS and BDN XML"
arch=('x86_64')
url="https://github.com/Masaiki/ass2bdnxml"
license=('GPL3')
depends=('zlib' 'libass' 'libpng')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Masaiki/ass2bdnxml/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('923f32c41bd719eb46a1b4887659061a57b4c3d53c1705b4839e3d755d6491df')

build() {
	cd "${pkgname}-${pkgver}"
        cmake -Bbuild -DCMAKE_BUILD_TYPE=Release .
        cmake --build build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "build/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
#	install -Dm 644 "ass2bdnxml.1" -t "${pkgdir}/usr/share/man/man1"
}
