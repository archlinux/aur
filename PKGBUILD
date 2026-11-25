# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tele-tui-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="Keyboard-first Telegram client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/sorokin-vladimir/tele"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'tele-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tele_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tele_linux_arm64.tar.gz")
sha256sums_x86_64=('7e1f1ecdac2192229e0f812520aa1ef5f48e3787e82fedc91f6a0d75f120720c')
sha256sums_aarch64=('3e591fb3e8886a4b7a2bab6427959e21e109c360504fcb38f52fbed1eef9c1ac')

package() {
  install -Dm755 "tele" "${pkgdir}/usr/bin/tele"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
