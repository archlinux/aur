pkgname=umadev-bin
_realver="1.1.0"
pkgver="1.1.0"
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

sha256sums_x86_64=('98e15bc1439f5d43ab9270e82a0b2d4cc5b398a428fab33715ac1023aa233beb')
sha256sums_aarch64=('d2538b69064c62f89dd7a9ee444c915c73949a8ffb648766d2c85c54d0b659d2')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  install -Dm755 "${srcdir}/umadev-${_realver}-${_triple}" "${pkgdir}/usr/bin/umadev"
}
