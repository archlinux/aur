# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=ezxml
pkgver=0.8.6
pkgrel=1
pkgdesc="A C library for parsing XML documents inspired by simpleXML for PHP."
arch=("x86_64")
url="http://ezxml.sourceforge.net/"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/ezXML/ezXML%20${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a68d52257dcb0ff2ad3d71c8c64311edb8030254bb8b581e229aeaba6231cdf9')

build() {
	cd "${pkgname}"
	make 
}

package() {
	cd "${pkgname}"
	install -d ${pkgdir}/usr/{include,lib}
	cp ezxml.h ${pkgdir}/usr/include/
	cp libezxml.a ${pkgdir}/usr/lib/
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=4 sw=4:
