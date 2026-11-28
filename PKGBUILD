# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holyarrs-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="One self-hosted app for your shows, movies and music"
arch=('x86_64' 'aarch64')
url="https://github.com/HolyArrs/HolyArrs"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/holyarrs_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/holyarrs_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('990a3f8f845a338356f968d5df7e31c3c5818d58127bd35142639c136cf2e844')
sha256sums_aarch64=('dfda64b6972521c5fe4a8d70824308400e26b254e70e50043296588a104f21ed')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="holyarrs_${pkgver}_linux_amd64" ;;
    aarch64) _dir="holyarrs_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/holyarrs" "${pkgdir}/usr/bin/holyarrs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
