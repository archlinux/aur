# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=transmission-telegram-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Control Transmission through a Telegram bot"
arch=('x86_64' 'aarch64')
url="https://github.com/pyed/transmission-telegram"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/transmission-telegram_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/transmission-telegram_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8b672cb107daacaf110172015b0a78b247d50659eb1780c935a5b7c283e82982')
sha256sums_aarch64=('f9bba1b144157134a39f5bf0f5c850ec4cacab3593f21d83edc840480a444f8e')

package() {
  install -Dm755 "./transmission-telegram" "${pkgdir}/usr/bin/transmission-telegram"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
