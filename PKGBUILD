# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Parham <parham at tuta dot io>
pkgname=icu4j
pkgver=74.2
pkgrel=1
pkgdesc="International Components for Unicode for Java."
arch=('any')
url="https://icu.unicode.org"
license=('custom:icu')
depends=('java-environment>=7')
_ghurl="https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}"
source=("${_ghurl}/${pkgname}-${pkgver}.jar"
        "${_ghurl}/${pkgname}-${pkgver}-fulljavadoc.jar"
        "${_ghurl}/${pkgname}-${pkgver}-sources.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver}.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver}-javadoc.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver}-sources.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver}.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver}-javadoc.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver}-sources.jar"
        "${pkgname}-license::https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE")
noextract=("${_ghurl}/${pkgname}-${pkgver}.jar"
           "${_ghurl}/${pkgname}-${pkgver}-fulljavadoc.jar"
           "${_ghurl}/${pkgname}-${pkgver}-sources.jar"
           "${_ghurl}/${pkgname}-charset-${pkgver}.jar"
           "${_ghurl}/${pkgname}-charset-${pkgver}-javadoc.jar"
           "${_ghurl}/${pkgname}-charset-${pkgver}-sources.jar"
           "${_ghurl}/${pkgname}-localespi-${pkgver}.jar"
           "${_ghurl}/${pkgname}-localespi-${pkgver}-javadoc.jar"
           "${_ghurl}/${pkgname}-localespi-${pkgver}-sources.jar")
sha256sums=('95c055080e14c093ebeeba5b733e1a1be7a4af5854668c774cedf070d4240e43'
            '49612f1f9b241b2b29357922111dd85c173b02ecdb9d3669a373fc625b60a86c'
            '80aee5c42a88e6f9b881d419ba142d2135da24ff9e2eb03d9324a1f121f955ff'
            '242e7b8a5136b18289d5f0677442fedfd835270451a048980755f8712dd8c91d'
            'f22b331565486c0fdfc3c078bb34f2ec593b9a63a0a67b3a6dcbee5452b11c30'
            'f1c9eb072269396c723327487fbae4304e7a33907098f30fc50ef12dda6189c2'
            '7b00eb4335ec4bbd2ee9e649f2edd3d89395867d31d15e97faee0a0fdf95be22'
            '1a44ddc18b7b18995cf35337cdad554f972d80815b5e8140f2a0d44377f416a7'
            '152bc5b8b329a97214d8299448b1a1446f4981c1ae020d0f138a9b9fd9ab1afc'
            'ebb83f7223b118ab69071c8dcc75605f08383521e14156005d9a07cef3df97bc')

package() {
    install -D -t "${pkgdir}/usr/share/java/${pkgname}" -m 644 icu4j*.jar
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}/charset"
    install -d "${pkgdir}/usr/share/doc/${pkgname}/localespi"
    install -D -m 644 "${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${pkgdir}/usr/share/doc/${pkgname}/"
    jar -xf "${srcdir}/${pkgname}-${pkgver}-fulljavadoc.jar"  
    cd charset
    jar -xf "${srcdir}/${pkgname}-charset-${pkgver}-javadoc.jar"  
    cd ../localespi
    jar -xf "${srcdir}/${pkgname}-localespi-${pkgver}-javadoc.jar"  
}
# vim:set ts=4 sw=4 et:
