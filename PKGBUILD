# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Parham <parham at tuta dot io>
pkgname=icu4j
pkgver=70.1
pkgrel=3
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
sha256sums=('2b4d8d4e098e86aa5f905ec81c46751d218b16afd3f7fc02b64f80dd20fffa20'
            '72afed415f6ffb5fa2e0eeec884d5b81afd83a135044d71408b0debe2e60e621'
            '4b8d6b2926db8a8a5a8756ef9dd866589fef316d536a4d602643c01d625b294b'
            'a2d52b2f42eb74c539a07d6dbeb9a41c80c0fb96def700d668517f905c56a0b4'
            '5e5352f5615b0f876956ed9e43639a15ddec3fcc709c6a2a799ed2790e07f3d3'
            '36d7e221d84855fe45de059a12efdcde42e03aafbd726302406b021814faaf4f'
            '683770060b534b69d2300b4f0c667ffe5c45b3603a8d9412bf4a8cd8cf2f5de2'
            'SKIP')

package() {
    install -D -t "${pkgdir}/usr/share/java/${pkgname}" -m 644 icu4j*.jar
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
    install -D -m 644 "${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
