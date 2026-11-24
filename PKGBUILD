# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ddqa-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Datadog's QA manager for GitHub repository releases"
arch=('x86_64' 'aarch64')
url="https://github.com/datadog/ddqa"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/datadog/ddqa/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ddqa-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ddqa-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('0f0895f459e2884a4240a187374e0045673518902993f827c98e54c7867b3eac')
sha256sums_x86_64=('77d627bee937a1b4b45625f752b981b12a84c3c4b77b6406a165afa06bb96052')
sha256sums_aarch64=('fabaffdda397e34ce6c98f006b5cdb8d7c03b5e2bd45dcbe0d00739f542d71a2')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/ddqa-${pkgver}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/ddqa"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
