# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=specter-tui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Deploy AI agents to dedicated VMs from an interactive TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/ghostwright/specter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'specter')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/specter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/specter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a1a43139efdf176ca83a98ca4e700be7a95c6db91c12f5e38c204b32dca099ef')
sha256sums_aarch64=('9a61418914017933f87976947ff269119cbcaf9287038bbb28dc898d76c7a7fe')

package() {
  install -Dm755 "specter" "${pkgdir}/usr/bin/specter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
