# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=veloq-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Agent-friendly GPU profile query CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/lucifer1004/VeloQ"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lucifer1004/VeloQ/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/veloq-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/veloq-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('fec14128f2498d32ee13794bdc8afd1c31d34eb07dcec66d30100ebc17c1580e')
sha256sums_x86_64=('6f362ad19a6faa95e806a214ddec62f5bbe63f3e668a4bb9126c0118d1d0dfe6')
sha256sums_aarch64=('b69213151635315e146a74e1cc35aa0c815fe628e8b9b734a4d4073059cb9f52')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="veloq-v${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="veloq-v${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/veloq" "${pkgdir}/usr/bin/veloq"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
