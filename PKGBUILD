# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monarch-bin
pkgver=2.1.10
pkgrel=3
pkgdesc="a tool for building Flutter widgets in isolation. It makes it easy to build, test and debug complex UIs."
arch=('x86_64')
url="https://monarchapp.io/"
_githuburl="https://github.com/Dropsource/monarch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.tar.xz::https://d148mrbia1nlbw.cloudfront.net/linux/${pkgname%-bin}_linux_${pkgver}.tar.xz"
    "LICENSE::https://raw.githubusercontent.com/Dropsource/monarch/${pkgname%-bin}-binaries-${pkgver}/LICENSE")
sha256sums=('f8eedfeafb19a391aecddbdfbee58d8eb7928a68136243efcb424ce60cd1508c'
            '6d103cf91ac337450bdb2c10aa56dce34c723e30c3a44e3dd2acb4fdda142729')
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}