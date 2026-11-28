# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mc-router-bin
pkgver=1.57.1
pkgrel=1
pkgdesc="Route Minecraft client connections to backend servers by requested address"
arch=('x86_64' 'aarch64')
url="https://github.com/itzg/mc-router"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mc-router_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mc-router_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cb7677e689a3f44ec0a737ac20ccccc22e8ff62b532514c304b246d3daaba9ef')
sha256sums_aarch64=('20d68747d4ab0563fe336c05e9b47805369ca245c3aefaf3e439318bfd481d54')

package() {
  install -Dm755 "mc-router" "${pkgdir}/usr/bin/mc-router"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
