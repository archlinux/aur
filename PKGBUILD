# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=observer_ward-bin
pkgver=2026.11.3
pkgrel=1
pkgdesc="Web application and service fingerprinting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/emo-crab/observer_ward"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/observer_ward_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/observer_ward_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('14324448a6eccd2f2f13ab2c987344dd46a980442d8ac397569ff6606194424d')
sha256sums_aarch64=('b9923edbe9f41a6e0b796ff3603b1fccade03662c635c39ac04c9758c889d981')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/x86_64-unknown-linux-musl" "${pkgdir}/usr/bin/observer_ward"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
