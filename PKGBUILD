# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-1c-bin
pkgver=1.24.7
pkgrel=1
pkgdesc="MCP server for 1C:Enterprise configurations and BSL code generation"
arch=('x86_64' 'aarch64')
url="https://github.com/feenlace/mcp-1c"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/feenlace/mcp-1c/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mcp-1c-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mcp-1c-linux-arm64")
sha256sums=('3683c196c497b7ebe29f36a6dad5044a1cef73162e0ef934904fdfce311ee8e5')
sha256sums_x86_64=('93a575305dfbcf34851091fee08ab5312a77d4c97e489c4d767af7be852829fe')
sha256sums_aarch64=('ae15a9796686fcd42cd5cc996d4417745648db8f3a1838e5e6ab4bd1ad2f0559')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mcp-1c"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
