# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holyarrs-bin
pkgver=1.3.5
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
sha256sums_x86_64=('845d4489d6b78164edd7f2021efc43a9aaf80fb6d8d50c6bbdd09be81c7e1cb5')
sha256sums_aarch64=('5f31b0f29a757d421ed72fcd963bd565928ba40839992c1f84a0d27513d83b2e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="holyarrs_${pkgver}_linux_amd64" ;;
    aarch64) _dir="holyarrs_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/holyarrs" "${pkgdir}/usr/bin/holyarrs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
