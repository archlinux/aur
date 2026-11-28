# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mail-mcp-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Secure MCP server for IMAP, SMTP, EWS and Microsoft Graph mail"
arch=('x86_64')
url="https://github.com/tecnologicachile/mail-mcp"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/mail-mcp-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('d3e56a36a7f4bc842afa87f4c44910fdc6ce1fa766bc7d5db3f264818380e577')

package() {
  install -Dm755 "mail-mcp-x86_64-unknown-linux-gnu/mail-mcp" "${pkgdir}/usr/bin/mail-mcp"
  install -Dm644 "mail-mcp-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "mail-mcp-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
