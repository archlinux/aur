# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-trino-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="MCP server for Trino"
arch=('x86_64' 'aarch64')
url="https://github.com/tuannvm/mcp-trino"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcp-trino_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcp-trino_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f4736c62100dc4afabe9670530934e7c525180638e25e0a1dc5731b4d26d771c')
sha256sums_aarch64=('e9e49185f61abcff4218f4cbbbeecac51609e3933e00c0d44638a5bd846c009d')

package() {
  install -Dm755 "mcp-trino" "${pkgdir}/usr/bin/mcp-trino"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
