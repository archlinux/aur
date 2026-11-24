# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tele-tui-bin
pkgver=2.1.3
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
sha256sums_x86_64=('289fc41ae2ea384b9ddda778858b907b3f20bd610f9864e3fd81a868e0e53d37')
sha256sums_aarch64=('449521c8b5b4995725e2855b0c9973d2096ce0ecb014b6dd260e16736daef751')

package() {
  install -Dm755 "tele" "${pkgdir}/usr/bin/tele"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
