# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=31.3.2
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('196ca27a73da17a2ab33ddc0fc08600d6a8456a8762165f616db884165331c585ba001f41c2bdfb458dcd718be2c4150f04b080b67a8c94932d4ed2d916654a8')

build() {
#	cd "${srcdir}/${pkgname}-${pkgver}/etc/dependencies/"
#	npm install
	cd "${srcdir}/${pkgname}-${pkgver}/etc/build/"
	ant all
}

package() {
	install -dm0755 "${pkgdir}/usr/share/webapps/drawio"
	cp -r ${srcdir}/${pkgname}-${pkgver}/src/main/webapp/* "${pkgdir}/usr/share/webapps/drawio/"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
