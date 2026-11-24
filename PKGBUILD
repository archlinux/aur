# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=contrabass-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Project-level orchestrator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/junhoyeo/contrabass"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/contrabass_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/contrabass_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8b6c5b7a54dbe2a50308b834e1fcf58bb39cddb0bd3f813dfae63524fd363075')
sha256sums_aarch64=('bf6f988d48c3e5bb038b412a09db640c64a93da0ed04adfc2d84aa016e85bb4d')

package() {
  install -Dm755 "contrabass" "${pkgdir}/usr/bin/contrabass"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
