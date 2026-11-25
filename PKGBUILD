# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fabro-bin
pkgver=0.254.0
pkgrel=1
pkgdesc="The open source dark software factory for expert engineers"
arch=('x86_64' 'aarch64')
url="https://github.com/fabro-sh/fabro"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fabro-sh/fabro/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fabro-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fabro-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('9d8408208299ecc4a14d8ec82f7a263a47e0672360d8025b4394c45ed8e1cdbc')
sha256sums_x86_64=('ccfa12394fd928c3194fd9af04daa9417989b9e3f9cb37d71a5df63f3143e787')
sha256sums_aarch64=('5a87a599822494ca2b946229cd3a12a8d51f62fefda61980296116e31bb8e1f6')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fabro-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fabro-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fabro" "${pkgdir}/usr/bin/fabro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
