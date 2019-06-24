# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=icu4j
pkgver=64.2
pkgrel=1
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
sha256sums=('ec5a7d92495a2c0f0a09506aef935cca6a68ce8ac18fbae105381a38288127e3'
            '739432de83b518d277774a49ed8c76176eb9779ec19045613d186e594024a1e7'
            '29ada0a78857c0ce4915052174e26457156f3934670890c3c574b7a9570cbdcc'
            'f224d66b9a3f3e03260837a58c18ab07ca30241462c297aea444704df20683fe'
            '87dc0324ed781e74a6564e446fc317d2e1d406d1d1aee1e53b5251d762d5b4d4')

package() {
  install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}/
	cp ./icu4j*.jar ${pkgdir}/usr/share/java/${pkgname}/
	cp -a ./{com,*.{html,css,js}} ${pkgdir}/usr/share/doc/${pkgname}/
	cp ./${pkgname}-license ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim:set ts=2 sw=2 et:
