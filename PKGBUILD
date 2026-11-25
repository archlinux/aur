# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=supergateway-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="Run MCP stdio servers over HTTP streamable, SSE and SSE over stdio"
arch=('x86_64' 'aarch64')
url="https://github.com/supercorp-ai/supergateway"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/supergateway-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/supergateway-linux-arm64.tar.gz")
sha256sums_x86_64=('b6d74e1e2c286b12b843e7d58d9bee54d90cb7173bbad4fc31c68324d5d8a32c')
sha256sums_aarch64=('0fd7a1f4f1d4ef6c1b1a6f1cdb12c6f2601fb9da6d9660a1c64094b9550f368a')

package() {
  install -Dm755 "supergateway" "${pkgdir}/usr/bin/supergateway"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
