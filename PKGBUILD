# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chengla-linux-unofficial-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="橙啦平台的非官方 Linux 客户端"
arch=("x86_64")
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL3")
depends=('bash' 'electron25')
makedepends=('gendesk')
providers=("${pkgname%-bin}-${pkgver}")
conflit=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('181e05a3300df9395a36e6502987f48dc84d8d742f9bd5467648149d85d33d32'
            'dc7920acba01032a90072d084275d4d76774d3986f68b562169046c0e4e4b00b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar.unpacked/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.top"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "chengla-linux橙啦" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}