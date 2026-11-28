# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=make-look-scanned-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Make PDFs look scanned"
arch=('x86_64' 'aarch64')
url="https://github.com/overflowy/make-look-scanned"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/make-look-scanned_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/make-look-scanned_linux_arm64.tar.gz")
sha256sums_x86_64=('afb683a62d2d26f4e26be28fe502c00aa32eda0d006ec8353678274fca3685ef')
sha256sums_aarch64=('d921f1b8c483d10802e98be9269a337f4ee8e26669025b55529188c138ad9aeb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="make-look-scanned_linux_amd64" ;;
    aarch64) _dir="make-look-scanned_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/make-look-scanned" "${pkgdir}/usr/bin/make-look-scanned"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
