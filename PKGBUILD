# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monarch-bin
pkgver=2.1.10
pkgrel=2
pkgdesc="a tool for building Flutter widgets in isolation. It makes it easy to build, test and debug complex UIs."
arch=('x86_64')
url="https://monarchapp.io/"
_githuburl="https://github.com/Dropsource/monarch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.tar.xz::https://d148mrbia1nlbw.cloudfront.net/linux/${pkgname%-bin}_linux_${pkgver}.tar.xz"
    "LICENSE::https://raw.githubusercontent.com/Dropsource/monarch/main/LICENSE")
sha256sums=('a57e970e9cd7346fab8a42383cd5b816cae9b6e94ab056a905451f7b6765c75b'
            '6d103cf91ac337450bdb2c10aa56dce34c723e30c3a44e3dd2acb4fdda142729')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname%-bin}/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}