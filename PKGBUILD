# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jegrep-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Semantic code grep powered by Jev"
arch=('x86_64' 'aarch64')
url="https://github.com/can1357/jegrep"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jegrep-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jegrep-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6170fd6ad2cfc967d58c890abd2d2021eec1bdaacf960ad63617509007c27acc')
sha256sums_aarch64=('10aad0ae11c63ad9f445ac86581f0b6296f0b4a96baa220acdf0ded26b8d6882')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="jegrep-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="jegrep-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/jegrep" "${pkgdir}/usr/bin/jegrep"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-walker" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
