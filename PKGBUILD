# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-code-statusline-pro-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="Feature-rich statusline for Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/Wangnov/claude-code-statusline-pro"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('380d60464dbd7c1056cf4b77a5b2704bb240aa525bb1a768166816f6c4f1db79')
sha256sums_aarch64=('33f1279d8d7076b84aaff51a5dbe97ffa79b88a6478ca6cc8caa08041fae282d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="claude-code-statusline-pro-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="claude-code-statusline-pro-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/claude-code-statusline-pro" "${pkgdir}/usr/bin/claude-code-statusline-pro"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
