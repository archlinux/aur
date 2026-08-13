# Maintainer: rendogust <rendogust@gmail.com>
# https://github.com/yookibooki/aur-packages/issues
# Telegram: @javohir81

pkgname=umadev-bin
_realver=1.0.73
pkgver=1.0.73
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

sha256sums_x86_64=('ad111858f73ef39e955ea4a6cdc83d92b53d5ca0248a94095ff0448c7b147e29')
sha256sums_aarch64=('fff3a86cb99a168e23466f1282a9200e17b9d57845bcd36e079706d9e39eec96')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  install -Dm755 "${srcdir}/umadev-${_realver}-${_triple}" "${pkgdir}/usr/bin/umadev"
}
