# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=email-mcp-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Email MCP server with full IMAP and SMTP support"
arch=('x86_64' 'aarch64')
url="https://github.com/codefuturist/email-mcp"
license=('LGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/email-mcp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/email-mcp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bb444c2bf71c0d3fb3f763e076322afeff30a79ae2ddad0377231ca59be08dfe')
sha256sums_aarch64=('04e8b118f452c1193d5afa7a3784ddec8d8500513a6d02843ffd5bc8392afc87')

package() {
  install -Dm755 "email-mcp" "${pkgdir}/usr/bin/email-mcp"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
