# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wado-bin
pkgver=0.0.40
pkgrel=1
pkgdesc="Wado programming language"
arch=('x86_64' 'aarch64')
url="https://github.com/wado-lang/wado"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wado-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wado-linux-aarch64.tar.gz")
sha256sums_x86_64=('8424798abcc289317da01b9587410ab4215ebd9d303ff04fa4262a132e3b5275')
sha256sums_aarch64=('d1c9e2852a7150989aec830b90c54bfb12f73cb9a93a0739196b5183217f466c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="wado-linux-x86_64" ;;
    aarch64) _dir="wado-linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/wado" "${pkgdir}/usr/bin/wado"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
