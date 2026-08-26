pkgname=umadev-bin
_realver="1.1.1"
pkgver="1.1.1"
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

source_x86_64=("umadev-${_realver}-x86_64-unknown-linux-gnu::https://github.com/umacloud/umadev/releases/download/v${_realver}/umadev-x86_64-unknown-linux-gnu")
source_aarch64=("umadev-${_realver}-aarch64-unknown-linux-gnu::https://github.com/umacloud/umadev/releases/download/v${_realver}/umadev-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('e55ddf403d8b3601a3e51caa7698b0f9588829bc32463cc686ba54e9e043d679')
sha256sums_aarch64=('66abbf1412ddc8c16c732c0621dd3ada0532b36ffaac6a51b41da9a4a6c463f5')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  install -Dm755 "${srcdir}/umadev-${_realver}-${_triple}" "${pkgdir}/usr/bin/umadev"
}
