# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Parham <parham at tuta dot io>
pkgname=icu4j
pkgver=71.1
pkgrel=1
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="https://icu.unicode.org"
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
sha256sums=('91c4f8ebf0ceb489547098fe9d5c09a65eb419caea6ed714867f5280800bcf1a'
            'b775182c507e9b2efce231275abfeaee6dfdcc11cd4aacddb7d3f1709fc6f8d7'
            'db804ebf5b8cc1aed3e034bd714a68ca973d8ff3c9f3d1b23d67dc83fc596055'
            '5ac6b3c9e1edd55d10f473a780705d3b14a96d238b745a638fbcf9f8af02204e'
            'dd615da4a1bb44b9a665253e4a231b9d050e830b264c7f4ef525ad29bc4c1c10'
            '857061c37cfc4f7e02696e4a0859befbf2caa38a64a250d9e40dffb627749f67'
            '7c94733bf21bb135914e65927aba84aa4023f83b6db1d8cc6ae9284afc6e399a'
            '2dc50618eb621aabc10d33c77266326ce73c6e11a6fa8fe96701d4e964e96434')

package() {
    install -D -t "${pkgdir}/usr/share/java/${pkgname}" -m 644 icu4j*.jar
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
    install -D -m 644 "${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
