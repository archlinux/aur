# Maintainer: Martin Harrigan <martinharrigan at gmail.com>
pkgname='discord-stock-ticker-bin'
pkgdesc="Live stock and crypto tickers for your Discord server."
url='https://github.com/rssnyder/discord-stock-ticker'
pkgver='3.10.8'
pkgrel='2'
arch=('x86_64')
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('python')
source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/rssnyder/discord-stock-ticker/master/LICENSE")
sha256sums=('db289773dc9d361aad72acff92a6369909e4dbbff84c1f83f4f726e13dd1a53d'
            '1a716aace1fc8c3ac66ce95223b185629bc03734e805e9b7cacc4f03f3275766')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
