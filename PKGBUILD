# Maintainer: Parham <parham at tuta dot io>

pkgname=icu4j
pkgver=67.1
pkgrel=1
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
sha256sums=('c4eb904caf5fba968a2f1a3b8aef14df801e9329b21697209ca30bfcf153867d'
            '2313076465b7f6aca318fca5523956db9272e30a0524c0749b435952417197d3'
            'f6ac585fd0913c2e12b156831b9755e5b9a09e77f013738db79e677f08180076'
            '0ad414c75ec928943392a4d684f29b1f322dec13b32c9480c4eadb5fa091cb28'
            '567b5377d70ce9cf902499c40ac3dde58316c2fe7938f41def7d45c3871bfae5'
            'ef65382254ce991bc250e7106df61e1c9af648cee693e9c2262895f1c7498f3c'
            '773f823b843c92a117ab66f6b9f47c08bb5a90fa52ad7b55c4d4b028c5fd212d'
            'SKIP')

package() {
    install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}
    cp ./icu4j*.jar "${pkgdir}/usr/share/java/${pkgname}/"
    cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
    cp "./${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
