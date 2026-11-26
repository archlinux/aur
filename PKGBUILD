# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=avdslim-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="Reduce Android Virtual Device emulator RAM usage"
arch=('x86_64' 'aarch64')
url="https://github.com/kdbhalala/avdslim"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/avdslim_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/avdslim_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bb4adaec3b33a084c134162a384b3687696b8c98ad92eeb8ba0ccd841f345569')
sha256sums_aarch64=('79a46fa206bda6db67206337a3b78f503f8cd426e4b4b604b6bb26aaf46ed4e4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="avdslim_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="avdslim_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/avdslim" "${pkgdir}/usr/bin/avdslim"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
