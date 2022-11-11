# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Parham <parham at tuta dot io>

pkgname=icu4j
pkgver=72.1
pkgrel=1
pkgdesc="International Components for Unicode for Java."
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
sha256sums=('3df572b240a68d13b5cd778ad2393e885d26411434cd8f098ac5987ea2e64ce3'
            '84c41e82f53872420b54a4fa67dc225a8249e913f1fb094394f6ad54d51d5ab4'
            'e90b4f8dd0e0ed1f8d5bf42c91c93d8aea13882eedd7aa3808123e7cb621f5d9'
            'd7d9b5199ad06c8c53f043faf3fc42867e9415665e8b60edd0cd7297b3784734'
            '7a748b1d367106c489bcd11a06dce402d831adaf063c229659d83339a66e4dd8'
            'ae82ceb194e8d23da89bb6253151f5e8a732e0989eae70afb90b4d709d58ef73'
            'dfb4a8111978d2d915d10cad871df3838d21709a449b2011b6b7327e27987520'
            'd9bde932248027a838472cc91ae397c36a5012f6eb4dbe3ac98585f742f4fb05')

package() {
    install -D -t "${pkgdir}/usr/share/java/${pkgname}" -m 644 icu4j*.jar
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
    install -D -m 644 "${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
