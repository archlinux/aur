# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=31.5.3
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f2daca19d3ff255854a1b3a53e784a53e06113a8a05ed36d5fdaa9cb0dc5da60b1d139eebfbc6068d9c7863aa7d103eb4dd5a1d74b3e2b3562a352f931cba309')

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
