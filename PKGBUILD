# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=calepin-bin
pkgver=0.0.63
pkgrel=1
pkgdesc="Computational notebooks in Typst"
arch=('x86_64' 'aarch64')
url="https://github.com/vincentarelbundock/calepin"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/calepin-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/calepin-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('17011bef797d844790bc910cfabc013bab344a2a45f9bd12b2a56ebc23f57a35')
sha256sums_aarch64=('c49a7b7343bed8cf94f8acdab983c8392ef815f111a4382971b4aa7b7afb2b34')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="calepin-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="calepin-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/calepin" "${pkgdir}/usr/bin/calepin"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
