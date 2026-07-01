# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=skillsdash-bin
_pkgname=skillsdash
pkgver=0.1.0
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
sha256sums_x86_64=('384c4cca8d410b036f36cd8ddd22194b8df3267864bef56e2b2910cb4193d81c')
sha256sums_aarch64=('593fd807eb182f164a961474aae40890ae506d6515be0f51c0cb4255e6296985')

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
