# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=30.2.4
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a95a3cf5f376a680d50fc09c7d1246cf2eefef1cf4ce44e458a3a9a257c3ee72c50667b812cb91c4efe5489d5a5339cae58689871c3b3412a7f813c0b6804a4c')

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
