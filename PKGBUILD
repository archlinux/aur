# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=skillsdash-bin
_pkgname=skillsdash
pkgver=0.3.0
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
sha256sums_x86_64=('cdde12e59cb77ab69430a3ca9e40b73ffc778da33937060edd4bc53edd66882b')
sha256sums_aarch64=('59926f57b1002ad3bf56c17482842ef48458f697c8dcecc6661070df52550b00')

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
