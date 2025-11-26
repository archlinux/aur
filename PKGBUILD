# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>

_pkgname="firefox-webserial"
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Native connector for WebSerial API in Firefox'
arch=('x86_64')
url='https://github.com/kuba2k2/firefox-webserial'
license=('MIT')
conflicts=('firefox-webserial')
source=(
    "${pkgname}-${pkgver}::https://github.com/kuba2k2/firefox-webserial/releases/download/v${pkgver}/firefox-webserial-linux-x86-64"
    "io.github.kuba2k2.webserial.json"
    "LICENSE"
)
sha256sums=('c7322082807f1136304b9b0237f1cc78d61518d8c7d38719e31c8008a0e0b678'
            'ef35bfe2fc564a5af91717cc1ff3801899ae81e53041fc151e7cadce229b6bde'
            '5a2a80065b9198653b5309b42ffdc0c2ce074a94a3922c95282b1ad369f8cf71')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/io.github.kuba2k2.webserial.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/io.github.kuba2k2.webserial.json"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
