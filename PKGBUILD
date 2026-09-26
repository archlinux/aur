# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=scout-mcp-bin
_pkgname=scout-mcp
pkgver=0.0.7
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
sha256sums_x86_64=('e1e534eb981030a115fe701b767339bb9a8c0578ee7a6ed566ca603985e044d8')
sha256sums_aarch64=('38a3c9f9f854ab5b228697300f41030323ff1029fbd37e4319234f3affdcbd4a')

package() {
  install -Dm755 scout-mcp "${pkgdir}/usr/bin/scout-mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
