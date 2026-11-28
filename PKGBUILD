# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arkeep-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Agent for Arkeep, self-hosted backup management for multiple servers"
arch=('x86_64' 'aarch64')
url="https://github.com/arkeep-io/arkeep"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/arkeep-agent_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/arkeep-agent_linux_arm64.tar.gz")
sha256sums_x86_64=('784496788c7083edb8b9ac19118d78287282fc7643d05f56fcce2b22500439ba')
sha256sums_aarch64=('e03916ca8b35d4d9b5367b27a80f8a724e9c5b54e03f42f98df449b1249e670e')

package() {
  install -Dm755 "arkeep-agent" "${pkgdir}/usr/bin/arkeep-agent"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
