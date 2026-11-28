# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=formualizer-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Embeddable spreadsheet engine that parses and evaluates Excel workbooks"
arch=('x86_64' 'aarch64')
url="https://github.com/PSU3D0/formualizer"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/formualizer-cli-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/formualizer-cli-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('21fab17e2337be778323f514ab905e125e22c3cd98cc4a0f8c7d22541d11fd35')
sha256sums_aarch64=('07b6fe5c22f89566e260bcc76f695e79c1ac974ca88c7d1c225a505041e8e20e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="formualizer-cli-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="formualizer-cli-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/formualizer" "${pkgdir}/usr/bin/formualizer"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
