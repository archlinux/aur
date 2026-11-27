# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64' 'aarch64')
url="https://git.b4mad.industries/agentic-forges/forgejo-mcp"
license=('MIT')
options=('!debug')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://git.b4mad.industries/agentic-forges/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://git.b4mad.industries/agentic-forges/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7f29d6e3c452f74f920fa06f89e7ad7f0c0047f39522cb36ff596f0cdd9fe069')
sha256sums_aarch64=('960d0a3b2d9121cb2b48b0759713f5f29bf5274d4df9bf91aa62e9e3561d7c16')

package() {
    local _arch=amd64
    [[ ${CARCH} == aarch64 ]] && _arch=arm64
    cd "forgejo-mcp_${pkgver}_linux_${_arch}"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
