# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=skillsdash-bin
_pkgname=skillsdash
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform TUI for managing AI skills across Claude and Agents providers"
arch=('x86_64' 'aarch64')
url="https://github.com/saeedvaziry/skillsdash"
license=('MIT')
provides=('skillsdash')
conflicts=('skillsdash')
options=('!strip')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2c4b9c6ff9f673242326eb4e62bcb3010c8f16e5de7ceca5a3ea88813c1f9d6a')
sha256sums_aarch64=('30d5e0c5528299d38681f21a2964bf537fcb68bd716c80eb3df5984351f55b83')

_srcdir() {
  case "$CARCH" in
    x86_64) echo "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) echo "${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
}

package() {
  local dir
  dir="$(_srcdir)"
  install -Dm755 "${srcdir}/${dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
