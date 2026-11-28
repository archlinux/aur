# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofer-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="Self-hosted multi-account email client with JMAP, IMAP, Gmail and Outlook support"
arch=('x86_64' 'aarch64')
url="https://github.com/cristianadrielbraun/gofer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gofer-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gofer-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('575f3ba44a981ed0215b0b6cdab0309ed6fcd80e45029512f85c9d67fd4ecc3c')
sha256sums_aarch64=('68d797998deed068c0fdae4aec25df8ee8c5513310c77fb182057a5b6d315c81')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gofer-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="gofer-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/gofer" "${pkgdir}/usr/bin/gofer"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
