# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rust-mcp-filesystem-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Fast asynchronous MCP server for filesystem operations"
arch=('x86_64' 'aarch64')
url="https://github.com/rust-mcp-stack/rust-mcp-filesystem"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rust-mcp-filesystem-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rust-mcp-filesystem-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4c6a7fd06f1e55bd2928610b0b6ecb6e8589ca816fb7ea17b6a2b2f36a30e00c')
sha256sums_aarch64=('79f0022e86532b74a6ef02e3b5745d90bc50852dd6d1c47414e0a6a292f6a310')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rust-mcp-filesystem-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="rust-mcp-filesystem-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/rust-mcp-filesystem" "${pkgdir}/usr/bin/rust-mcp-filesystem"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
