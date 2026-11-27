# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mc-router-bin
pkgver=1.57.0
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
sha256sums_x86_64=('7cdd5352d9cf09168d762cd70d8be2648987028fd3d80336f0f7db92aeb1265e')
sha256sums_aarch64=('90c6457e6b262b5ec0b2609d2703db8ce452c03f4b2cf51a38cc41285e52e934')

package() {
  install -Dm755 "mc-router" "${pkgdir}/usr/bin/mc-router"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
