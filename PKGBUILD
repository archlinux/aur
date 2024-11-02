# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
pkgname='discord-stock-ticker-bin'
pkgdesc='Live stock and crypto tickers for your Discord server.'
url='https://github.com/rssnyder/discord-stock-ticker'
pkgver='3.10.8'
pkgrel='3'
arch=('x86_64')
license=('MIT')
depends=('python')
install="${pkgname%-bin}.install"
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz"
        "${pkgname%-bin}.service"
        "LICENSE::https://raw.githubusercontent.com/rssnyder/discord-stock-ticker/master/LICENSE")
sha256sums=('db289773dc9d361aad72acff92a6369909e4dbbff84c1f83f4f726e13dd1a53d'
            '88a3dd9816d9fbcced350b74d24fb9a5fe7061061b421b652780b08122463811'
            '1a716aace1fc8c3ac66ce95223b185629bc03734e805e9b7cacc4f03f3275766')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
    mkdir -p "${pkgdir}/var/lib/${pkgname%-bin}" "${pkgdir}/var/log/${pkgname%-bin}"
}
