# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=26.1.1
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('da77ffdb7debb4ca45e607725a44931b7cd1735db786955f6eb4e7e9791eddc319a95909967d1388c19d73f44c4461b52b2d57a0f2f9e0d11cf16445a19b4c75')

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
