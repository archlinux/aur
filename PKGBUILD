# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=termsvg-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Record, share and export your terminal as an animated SVG"
arch=('x86_64' 'aarch64')
url="https://github.com/MrMarble/termsvg"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/termsvg-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/termsvg-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('712e0736c3fb495e7c363af799b2e3f9c65c84c8bbf265b7cf80817176f74464')
sha256sums_aarch64=('5a39a0bafb540f092185b7fb256dcddaef6e296eed1fb022f6aa56191a6f4b54')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="termsvg-${pkgver}-linux-amd64" ;;
    aarch64) _dir="termsvg-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/termsvg" "${pkgdir}/usr/bin/termsvg"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
