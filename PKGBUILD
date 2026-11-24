# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sacha-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Keyboard-first AWS TUI inspired by two-pane file managers"
arch=('x86_64' 'aarch64')
url="https://github.com/sachamama/sacha"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sacha_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sacha_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('25121959011923edae91ff7d151948a7f86dc3d8976844869bc379d2e83c9dce')
sha256sums_aarch64=('e56534cd67dcd62c4942b8bea63a85de2ba0fd6633a72626a572ae658e2a2795')

package() {
  install -Dm755 "sacha" "${pkgdir}/usr/bin/sacha"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
