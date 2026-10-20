# Maintainer: Dmitriy Geels <dmitriy.geels@gmailcom>
pkgname=slack-mcp-server-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='MCP server for Slack — enables LLM agents to read channels, threads, and DMs via browser or bot tokens'
arch=('x86_64' 'aarch64')
url='https://github.com/korotovsky/slack-mcp-server'
license=('MIT')
provides=('slack-mcp-server')
conflicts=('slack-mcp-server')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/korotovsky/slack-mcp-server/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/korotovsky/slack-mcp-server/releases/download/v${pkgver}/slack-mcp-server-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/korotovsky/slack-mcp-server/releases/download/v${pkgver}/slack-mcp-server-linux-arm64")

sha256sums=('c9c83612abe6c352b95a2fc1146638accdd5b348b21cdef333cc78f756e22397')
sha256sums_x86_64=('d1525962e9b9dbfdd2eaf48d0a81ca1eca7d8f1862b8d34931b812c850b3e568')
sha256sums_aarch64=('a307a48d16c2261346bdc257274cdcdb8b2027c867dc971b41d52cef36472c88')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/slack-mcp-server"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
