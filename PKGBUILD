# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=d4s-bin
pkgver=0.49.114
pkgrel=1
pkgdesc="Keyboard-driven TUI for Docker containers, Compose stacks and Swarm"
arch=('x86_64' 'aarch64')
url="https://github.com/jr-k/d4s"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/d4s_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/d4s_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('646be76165b2c88cdaa8ff220d20bfce645b1b99f63749932d492ac21ba28eb9')
sha256sums_aarch64=('726ee933e6894cfd9422589ff7ad57963d8a9443d5a1523951674aa59163387d')

package() {
  install -Dm755 "d4s" "${pkgdir}/usr/bin/d4s"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
