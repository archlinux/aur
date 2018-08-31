# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=icu4j
pkgver=62.1
pkgrel=1
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('java-environment')
makedepends=('apache-ant' 'java-environment=8')
source=("http://download.icu-project.org/files/${pkgname}/${pkgver}/${pkgname}-${pkgver//./_}.tgz")
sha256sums=('49b6ccc2fce95210022ed4d3fa6dea36c4156371f771f9b9b5696e20184c4ef0')

build() {	
	ant
	JAVA_HOME='/usr/lib/jvm/default/' ant docs
}

package() {
  install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}/
	cp ./icu4j*.jar ${pkgdir}/usr/share/java/${pkgname}/
	cp -a ./doc/* ${pkgdir}/usr/share/doc/${pkgname}/
	cp ./{APIChangeReport.html,readme.html} ${pkgdir}/usr/share/doc/${pkgname}/
	cp ./main/shared/licenses/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim:set ts=2 sw=2 et:
