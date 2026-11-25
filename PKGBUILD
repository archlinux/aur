# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lerd-bin
pkgver=1.39.2
pkgrel=1
pkgdesc="Local PHP development environment"
arch=('x86_64' 'aarch64')
url="https://github.com/lerd-env/lerd"
license=('MIT')
depends=('glib2' 'glibc' 'gtk3' 'libayatana-appindicator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lerd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lerd_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ec43a3185c2be540f8db59307a29848e51c441b576604b05f594bb5a86495499')
sha256sums_aarch64=('b48cb0d150570c54ea0e0d1f96c5a8e5be6d71d1becd5ac7422eb0b9c61efcdf')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/lerd" "${pkgdir}/usr/bin/lerd"
  install -Dm755 "${_dir}/lerd-tray" "${pkgdir}/usr/bin/lerd-tray"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
