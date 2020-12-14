# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jakartaee8-doc
pkgver=8.0.0
pkgrel=1
pkgdesc="Jakarta EE 8 documentation."
arch=('any')
url="https://github.com/eclipse-ee4j/jakartaee-api"
license=('EPL')
makedepends=('java-environment>=8' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8e0d71e64dff57d07d49d1aa463fd54b23fa189d4d31df6d8ba38449de1de88a')

build() {
	cd "jakartaee-api-${pkgver}"
	mvn -Pstaging install javadoc:javadoc
}

package() {
	cd "jakartaee-api-${pkgver}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-doc}/"
	cp -a "jakartaee-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/api"
	cp -a "jakartaee-web-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/web-api"
}
# vim:set ts=4 sw=4:
