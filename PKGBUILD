# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=easyeda2kicad
pkgver=1.9.2
pkgrel=2
pkgdesc="Convert EasyEDA designs to KiCad EDA"
arch=('any')
url="https://github.com/wokwi/easyeda2kicad"
makedepends=('npm')
license=('MIT')
#noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wokwi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('378fff1370e85b4cbd5956fc53907b7de90ae8f910d53ba13c98fecac416fb23')

package() {
	cd ${pkgname}-${pkgver}
    npm install -g --prefix "${pkgdir}/usr" ${pkgname}
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"
}
