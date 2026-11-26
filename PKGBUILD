# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cyberapi-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Small, fast API client built on GPUI"
arch=('x86_64' 'aarch64')
url="https://github.com/vicanso/cyberapi"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cyberapi-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cyberapi-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cbf5f9a326ab9f616306e63717387a30a6c69e7eeed45f88a430701761669fc4')
sha256sums_aarch64=('3d9d8ef300aa92a862e1dd5d867559ce32babab71a61dfb052f5ac2cf8708590')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cyberapi-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="cyberapi-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/cyberapi" "${pkgdir}/usr/bin/cyberapi"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
