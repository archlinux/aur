# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=watgbridge-bin
pkgver=1.13.16
pkgrel=1
pkgdesc="Bridge WhatsApp chats to Telegram"
arch=('x86_64' 'aarch64')
url="https://github.com/akshettrj/watgbridge"
license=('MIT')
depends=('glibc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/akshettrj/watgbridge/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/watgbridge_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/watgbridge_linux_aarch64")
sha256sums=('ac40dfa2090a2a579faaaba3112fb51226c2170af2dd66db211f0358d3815591')
sha256sums_x86_64=('99eff253cf4863ed3a13e498bc08b63ea366ed5d5b1da07aadb40df01f7afbdc')
sha256sums_aarch64=('3ad97349a4de75e6fe39423614288e84b01ddafc5da28670ddf129bd765fa6e6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/watgbridge"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
