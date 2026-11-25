# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openrun-bin
pkgver=1.2611.230
pkgrel=1
pkgdesc="Deployment platform for internal tools"
arch=('x86_64' 'aarch64')
url="https://github.com/openrundev/openrun"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/openrun-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/openrun-v${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('f96c53b8f906d07191675e939aa2e74722d702cc5a1fa3d32280d863cfb2921a')
sha256sums_aarch64=('9a87e5fbd30a3d256d94b43b415fdf545ee04f357edd83c6221ea2fe766cb35f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="openrun-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="openrun-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/openrun" "${pkgdir}/usr/bin/openrun"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
