# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holyarrs-bin
pkgver=1.3.1
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
sha256sums_x86_64=('896bc8a982296f00de7c36c5bfe0aba2becec68cb21c715cd30984cf15851792')
sha256sums_aarch64=('3166ba468bc4a77583b0e87dfcaa8de06316405ffc4b4498ab957e0ea7be876c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="holyarrs_${pkgver}_linux_amd64" ;;
    aarch64) _dir="holyarrs_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/holyarrs" "${pkgdir}/usr/bin/holyarrs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
