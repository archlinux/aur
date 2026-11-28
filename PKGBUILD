# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-cpp-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="MCP server for large C and C++ codebases"
arch=('x86_64' 'aarch64')
url="https://github.com/mpsm/mcp-cpp"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mpsm/mcp-cpp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mcp-cpp-server-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mcp-cpp-server-linux-aarch64")
sha256sums=('384c868c4bd77dd3d4262f03e7742630787665187bcbad5b946437c434c863ec')
sha256sums_x86_64=('555535c69a5087420ea283e323ff07c587d37a0a38c92b72e3765a898e83cfb4')
sha256sums_aarch64=('dffb360c33008da0293f43a54039b3faa70d404b7cb1617a2bfd9d18775be6e7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mcp-cpp-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
