# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=martty-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="An extensible Rust/ratatui terminal client for DeepSeek Harness and ACP-compatible coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/openma-ai/Martty"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/openma-martty-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/openma-martty-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('4de66bb64f6422c448a18681a2215df7dd0a4810fff12a613e22fe2040bb99af')
sha256sums_aarch64=('7e5b0b3de2369af7fdbb1e5535967eaa7ae3126a9d1b02c40194f9003862da55')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="package" ;;
    aarch64) _dir="package" ;;
  esac
  cd "$_dir"
  install -Dm755 "bin/martty" "${pkgdir}/usr/bin/martty"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
