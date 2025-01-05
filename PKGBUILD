# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=26.0.3
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e777a3f1cc1a69af07c065d39dea719936f1d1734b6985d346fcf05afdddebcfd57f6a360228463c937e2006629847aa26fc65c989cf258138ad52c95a37d2bf')

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
