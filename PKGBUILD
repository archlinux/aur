# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-graph-mcp-bin
pkgver=0.205.0
pkgrel=1
pkgdesc="AST knowledge graph MCP server for code search and impact analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/sdsrss/code-graph-mcp"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sdsrss/code-graph-mcp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/code-graph-mcp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/code-graph-mcp-linux-arm64")
sha256sums=('396eec88b000482bef3a475449fa6579dc76c87719265420c8e947954ad70e90')
sha256sums_x86_64=('d454de064b85368f060cbe2f5e8d98bdb09b6cb15324ad998b32433a77cc9285')
sha256sums_aarch64=('15a05dd263ec6a657bacc6c1c679adbf215c6d8b460f2b784413492f7f60f1a6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/code-graph-mcp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
