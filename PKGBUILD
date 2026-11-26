# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kite-mcp-server-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="MCP server for the Zerodha Kite trading API"
arch=('x86_64')
url="https://github.com/zerodha/kite-mcp-server"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zerodha/kite-mcp-server/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/kite-mcp-server-linux-amd64")
sha256sums=('ebc95ae05d2e11478474fec30f55980a2fbe68971bc3ffe7071225e7ae7b9cba')
sha256sums_x86_64=('12c5c0689ce87a1e577879818beb23df8ba791026cd2981ce88a484621ef5483')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kite-mcp-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
