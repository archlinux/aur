# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=db-mcp-server-bin
pkgver=1.15.1
pkgrel=1
pkgdesc="Multi-database MCP server giving AI assistants structured database access"
arch=('x86_64' 'aarch64')
url="https://github.com/FreePeak/db-mcp-server"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FreePeak/db-mcp-server/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/db-mcp-server-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/db-mcp-server-linux-arm64")
sha256sums=('bb09cee1be7b5ee9ee79849b947435c6facf7070ef58c9f92c11879ac6c454dc')
sha256sums_x86_64=('364290c018f6269c16ade6f2327c7d1cbf276af284f47ceca4bbcec7f0fd8da4')
sha256sums_aarch64=('93a5761ee3cabce8602bc4858b1cb3dc747353a384b4016623ebfd44ebe68801')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/db-mcp-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
