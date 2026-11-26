# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcpstore-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Manage MCP services"
arch=('x86_64' 'aarch64')
url="https://github.com/ip2a/mcpstore"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcpstore-v${pkgver}-linux-x64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcpstore-v${pkgver}-linux-arm64-gnu.tar.gz")
sha256sums_x86_64=('e4b7c2b0cea1accf3d91ad32aaf270f255ffa7c2fddb1c6931a61d6b8bf72e78')
sha256sums_aarch64=('b940dcaaa9eecdd26f78ee4c3ed9603debe9957c984c9d311f56e37b4b7985bf')

package() {
  install -Dm755 "mcpstore" "${pkgdir}/usr/bin/mcpstore"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
