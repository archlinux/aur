# Maintainer: rendogust <rendogust@gmail.com>

pkgname=umadev-bin
pkgver=1.0.55
pkgrel=1
pkgdesc='A coding agent that works like a real dev team, commanding the Claude Code / Codex / OpenCode you already use.'
arch=('x86_64' 'aarch64')
url='https://github.com/umacloud/umadev'
license=('MIT')
provides=('umadev')
conflicts=('umadev')

# Target triples per arch
# source_* and sha256sums_* auto-updated by publish.yml
_triple_x86_64="x86_64-unknown-linux-gnu"
_triple_aarch64="aarch64-unknown-linux-gnu"

source_x86_64=("umadev-${pkgver}-x86_64-unknown-linux-gnu::https://github.com/umacloud/umadev/releases/download/v${pkgver}/umadev-x86_64-unknown-linux-gnu")
source_aarch64=("umadev-${pkgver}-aarch64-unknown-linux-gnu::https://github.com/umacloud/umadev/releases/download/v${pkgver}/umadev-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('2e39232d73a983eb26608bbbba6c0f1010de6d5008a2b0942409d11393895d42')
sha256sums_aarch64=('04b4e1688a99e003a45a066125cc9394445626726e24ad9c53f555e6f5ec161e')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  install -Dm755 "${srcdir}/umadev-${pkgver}-${_triple}" "${pkgdir}/usr/bin/umadev"
}
