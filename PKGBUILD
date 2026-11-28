# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=3d-new-era-ai-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="Home design and floor plan editor with a built-in MCP server for AI agents"
arch=('x86_64')
url="https://github.com/leandrodaf/3d-new-era-ai"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/newera-linux-x64.tar.gz")
sha256sums_x86_64=('cb6a42bf66ec381b7c4610c2e279654abd2b18c00931799059c87a5a26f05c48')

package() {
  install -Dm755 "newera/newera" "${pkgdir}/usr/bin/newera"
  install -Dm644 "newera/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "newera/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "newera/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
