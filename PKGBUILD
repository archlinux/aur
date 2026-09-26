# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=scout-mcp-bin
_pkgname=scout-mcp
pkgver=0.0.6
pkgrel=1
pkgdesc="An MCP server exposing scout's diagnostics as read-only tools: evaluate an MCP server, or verify an attestation, from inside the agent"
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/scout-mcp'
license=('GPL-3.0-only')
# scout-mcp runs the scout program; it is not linked in.
depends=('scout')
provides=('scout-mcp')
conflicts=('scout-mcp')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('da66cc2c04295a91a5ad5458e7f8a850287b4335d258c71eb1824e9475c03079')
sha256sums_aarch64=('0eb650044b6a6acf25060201296f4751905e371ffc250e07bd2c16a75fdfad55')

package() {
  install -Dm755 scout-mcp "${pkgdir}/usr/bin/scout-mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
