# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-1panel-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="MCP server for 1Panel"
arch=('x86_64' 'aarch64')
url="https://github.com/1Panel-dev/mcp-1panel"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/1Panel-dev/mcp-1panel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mcp-1panel-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mcp-1panel-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('f410c4d2fded1d3254e7679cb7421f5f382d9a97ec251fd2f9e77cf58d369a06')
sha256sums_aarch64=('2e732dc32d78250d0c99cf9f84f0a2dffced73da4efecb188fb2d94193201ff8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mcp-1panel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
