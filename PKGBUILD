# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=icu4j
pkgver=63.1
pkgrel=1
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('java-environment')
makedepends=('apache-ant' 'java-environment>=8')
source=("http://download.icu-project.org/files/${pkgname}/${pkgver}/${pkgname}-${pkgver//./_}.tgz")
sha256sums=('c4d502e94f5fb98ba3d06819a7244f3ca3303527316d141f6d3e6cd1dd697ed3')

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
