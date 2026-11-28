# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=splitrail-bin
pkgver=3.13.1
pkgrel=1
pkgdesc="Real-time token usage and cost tracker for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Piebald-AI/splitrail"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/splitrail-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/splitrail-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a212ca9b35f8a1ecc591d6c1f2d4c4bb6dd97cd6727b516249210586d948b99f')
sha256sums_aarch64=('075249f25d3316a15688176a26af9cb5469dba5e116d0ec680fdf755a2c9700a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="splitrail-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="splitrail-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/splitrail" "${pkgdir}/usr/bin/splitrail"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
