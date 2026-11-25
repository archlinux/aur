# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentdock-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Secure MCP runtime for AI agents to operate local machines, servers and containers"
arch=('x86_64' 'aarch64')
url="https://github.com/uvwt/agentdock"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/uvwt/agentdock/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentdock_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentdock_linux_arm64.tar.gz")
sha256sums=('52329d75f907341ab1b9ef45c762b3b113cf2cf54182aad3abb052816fe16ef1')
sha256sums_x86_64=('e09c04ebb0043de392f258db0023c77691a42d51468910d9553dc1eb94913a3a')
sha256sums_aarch64=('ea873c86200b0bc94838f6a30ec89da83e7a8739bd6a5686119c35ad053f5aa8')

package() {
  install -Dm755 "bin/agentdock" "${pkgdir}/usr/bin/agentdock"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
