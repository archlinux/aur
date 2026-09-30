# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=passmcp-server-bin
_pkgname=passmcp-server
pkgver=0.0.4
pkgrel=1
pkgdesc="An MCP server exposing passmcp's diagnostics as read-only tools: evaluate an MCP server, or verify an attestation, from inside the agent"
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/passmcp-server'
license=('GPL-3.0-only')
# passmcp-server runs the passmcp program; it is not linked in.
depends=('passmcp')
provides=('passmcp-server')
conflicts=('passmcp-server')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f8f710f629f686e2ad3fbd865fbb06f3dff06e6872aa3f8ffcd5feaebc7be4e3')
sha256sums_aarch64=('ef6109b0a49967d183f1a320eff383a35c264f8f974c2fc5c52c8c7108fdb6b2')

package() {
  install -Dm755 passmcp-server "${pkgdir}/usr/bin/passmcp-server"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
