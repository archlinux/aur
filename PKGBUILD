# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=portato-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="SSH port-forwarding manager with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/portuber/portato"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/portato_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/portato_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('56fede09ac2cb4bbe584e8d401ce03e03c3ba9912310737500cc74a618a50fec')
sha256sums_aarch64=('d54240404226601a78a8ad5fec9f4d839dcd1e3e1d9052859c1ce3e3f6c28d45')

package() {
  install -Dm755 "portato" "${pkgdir}/usr/bin/portato"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
