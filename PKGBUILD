# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gtm-mcp-server-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="MCP server for Google Tag Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/paolobietolini/gtm-mcp-server"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gtm-mcp-server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gtm-mcp-server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e855b8db3771a948e68592a5a7b0c980505b512853d602c84ff0907a6cb02a9a')
sha256sums_aarch64=('09441ca1f1910b901d894416701a18047fbad7a6662972ba72f51aa31199e5ac')

package() {
  install -Dm755 "gtm-mcp-server" "${pkgdir}/usr/bin/gtm-mcp-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
