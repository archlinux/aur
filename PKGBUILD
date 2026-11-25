# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mc-router-bin
pkgver=1.56.5
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
sha256sums_x86_64=('773d37833e86f75517a4f9922aa021503a31244d2da18be37b39463332e3f9b8')
sha256sums_aarch64=('1f81fac52fcbe88e4813f5fa265bf44e520d2d1112ba1ede60c52551539cb8ea')

package() {
  install -Dm755 "mc-router" "${pkgdir}/usr/bin/mc-router"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
