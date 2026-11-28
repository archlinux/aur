# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chat-tails-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Chat server backed by Tailscale"
arch=('x86_64' 'aarch64')
url="https://github.com/bscott/chat-tails"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bscott/chat-tails/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/chat-tails-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/chat-tails-linux-arm64")
sha256sums=('faf83f923152d51e78985749324b2a833e333b48bfbc7c97b7d22d4f51476d8c')
sha256sums_x86_64=('9817a4f762f21e706a1ea54396e7a3813607425c12deba584139fbcba86786c8')
sha256sums_aarch64=('2b363172a0143e984d8903453bc78c10b4edff4825da14cb97ff8d12aed6c5f1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chat-tails"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
