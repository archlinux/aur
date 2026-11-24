# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=alter-zero-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Memory-efficient terminal agent harness for coding and automation"
arch=('x86_64' 'aarch64')
url="https://github.com/linuztx/alter-zero"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/alter-zero-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/alter-zero-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('deaf50adbef6db7c272fb27d886ceca4b8657e2b2d1292bc5186a350a718e1c4')
sha256sums_aarch64=('254bd7d9bf09d4dbca4634e6158a9d2dfa7c5665014139024b18f3554e4edf32')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="alter-zero-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="alter-zero-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/alter-zero" "${pkgdir}/usr/bin/alter-zero"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
