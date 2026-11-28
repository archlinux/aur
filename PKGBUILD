# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openings-mcp-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="MCP server that searches job boards and career sites"
arch=('x86_64' 'aarch64')
url="https://github.com/amikai/openings-mcp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openings-mcp_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openings-mcp_linux_arm64.tar.gz")
sha256sums_x86_64=('6cff8b1c62fcbf615c82426e119380da031f5da5a2fa40b5fdf7f05c03c4a5c8')
sha256sums_aarch64=('655af9bd731dd827fce8477935364a583f8c510379e6414610b896c4ee5cb291')

package() {
  install -Dm755 "openings-mcp" "${pkgdir}/usr/bin/openings-mcp"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
