# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=skillsdash-bin
_pkgname=skillsdash
pkgver=0.1.1
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
sha256sums_x86_64=('5df323b3de5a2d9647df4d66d1fbe91a61801f9a4627282f45821f129d3f80cb')
sha256sums_aarch64=('87affd3a81c5e3f18da4fddd99c1df78d8d4c10900b2aaa6c5111641bc0deaef')

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
