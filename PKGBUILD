# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-victorialogs-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="MCP server for VictoriaLogs"
arch=('x86_64' 'aarch64')
url="https://github.com/VictoriaMetrics/mcp-victorialogs"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcp-victorialogs_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcp-victorialogs_Linux_arm64.tar.gz")
sha256sums_x86_64=('6aad84c707a395b7fcfa28dff6a436954344938d100d42e0eb3faddd3aa41151')
sha256sums_aarch64=('bae8b6f7aec72a6e1c4fe6fc83552bbec35632fa82145dc83ea0fca05e55a792')

package() {
  install -Dm755 "mcp-victorialogs" "${pkgdir}/usr/bin/mcp-victorialogs"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
