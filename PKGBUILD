# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=icu4j
pkgver=65.1
pkgrel=2
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('java-environment>=7')
_ghurl="https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}"
source=("${_ghurl}/${pkgname}-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-${pkgver//./_}-docs.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver//./_}.jar"
        "${pkgname}-license::https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE")
noextract=("${pkgname}-${pkgver//./_}.jar"
           "${pkgname}-charset-${pkgver//./_}.jar"
           "${pkgname}-localespi-${pkgver//./_}.jar")
sha256sums=('041e677ddea663f219cd554ef1005ec27870207bb5420347af1d0268b3409291'
            '473009ebe8bdc7e7b2343130b13d62eb28ddf21289a09210730a34831e08c948'
            'dd01a87f5d74b48e179da3431d4886588c483649c462de19dedfd2b22dd7d573'
            'bb46e8951449ccafdab059569651d3d7a9de688e2e93ee1296874c46fb311a85'
            '4e27ee539396fcaa65e8475cf058f4882fe2190459490197ea085dad30c5bc9e')

package() {
  install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}/
	cp ./icu4j*.jar ${pkgdir}/usr/share/java/${pkgname}/
	cp -a ./{com,*.{html,css,js}} ${pkgdir}/usr/share/doc/${pkgname}/
	cp ./${pkgname}-license ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim:set ts=2 sw=2 et:
