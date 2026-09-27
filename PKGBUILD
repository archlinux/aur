# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=scout-mcp-bin
_pkgname=scout-mcp
pkgver=0.0.8
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
sha256sums_x86_64=('7ca19aea8a8687a49ac1f4f8a6a30a4a8ef89d288f70df9141d42709474e2078')
sha256sums_aarch64=('00f21a62c9079602be04edb2144c0410e59b2a206d8d7450d333cd30d8885017')

package() {
  install -Dm755 scout-mcp "${pkgdir}/usr/bin/scout-mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
