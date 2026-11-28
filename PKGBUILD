# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=telegram-mcp-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Telegram MCP server for dialogs, messages and drafts"
arch=('x86_64' 'aarch64')
url="https://github.com/chaindead/telegram-mcp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/telegram-mcp_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/telegram-mcp_Linux_arm64.tar.gz")
sha256sums_x86_64=('94bf9c1b1f7af621f5f86ef3e592d3f30f046a296eb38aad61743d1801126939')
sha256sums_aarch64=('c6fcf11b0fa8b8209b694ba26695c83814fabdc6b3442a968b6dbae85418fc47')

package() {
  install -Dm755 "telegram-mcp" "${pkgdir}/usr/bin/telegram-mcp"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
