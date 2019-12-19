# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=icu4j
pkgver=65.1
pkgrel=5
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('java-environment>=7')
_ghurl="https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}"
source=("${_ghurl}/${pkgname}-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-${pkgver//./_}-docs.jar"
        "${_ghurl}/${pkgname}-${pkgver//./_}-src.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver//./_}-src.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver//./_}-src.jar"
        "${pkgname}-license::https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE")
noextract=("${pkgname}-${pkgver//./_}.jar"
           "${pkgname}-${pkgver//./_}-src.jar"
           "${pkgname}-charset-${pkgver//./_}.jar"
           "${pkgname}-charset-${pkgver//./_}-src.jar"
           "${pkgname}-localespi-${pkgver//./_}.jar"
           "${pkgname}-localespi-${pkgver//./_}-src.jar")
sha256sums=('041e677ddea663f219cd554ef1005ec27870207bb5420347af1d0268b3409291'
            '473009ebe8bdc7e7b2343130b13d62eb28ddf21289a09210730a34831e08c948'
            'f25ca0db6ed0bb681686d6f19a06d03db0e721ab1dac4ec6059bbee561f83e10'
            'dd01a87f5d74b48e179da3431d4886588c483649c462de19dedfd2b22dd7d573'
            'bf94250fa9ac34f20bebd79b2bf6695b9c8deb0e35976257698182562137927a'
            'bb46e8951449ccafdab059569651d3d7a9de688e2e93ee1296874c46fb311a85'
            '91aa83a55a8d07c50a07e2bf0ac291fdbad4388619ec1a350b818387f1849a92'
            'SKIP')

package() {
  install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}
	cp ./icu4j*.jar "${pkgdir}/usr/share/java/${pkgname}/"
	cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
	cp "./${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
