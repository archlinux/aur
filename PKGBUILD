# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tact-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Terminal interface for Nanocodex"
arch=('x86_64' 'aarch64')
url="https://github.com/clabby/tact"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tact-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tact-aarch64-unknown-linux-gnu-v${pkgver}.tar.gz")
sha256sums_x86_64=('19982356f084cc4c6a52c71161c61859b71d0500ce297c215e88c58eb3653fc6')
sha256sums_aarch64=('ad377e8d5e594fd7cc02f71108b5fd30604aac05a1744e4388c1794c8fa63c52')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="tact-x86_64-unknown-linux-gnu-v${pkgver}" ;;
    aarch64) _dir="tact-aarch64-unknown-linux-gnu-v${pkgver}" ;;
  esac
  install -Dm755 "${_dir}/tact" "${pkgdir}/usr/bin/tact"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
