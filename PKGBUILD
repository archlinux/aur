# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kornia-slam-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time visual-inertial SLAM built on kornia-rs"
arch=('x86_64' 'aarch64')
url="https://github.com/kornia/kornia-slam"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kornia-slam-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kornia-slam-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ebce2ded637cf603da7659758f5438553fd5e7f932cf1098f09cc18ab1dd8095')
sha256sums_aarch64=('44c884c07c52457956234c90de461636c77b2f23fb037f8115e1d9b224e9815a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="kornia-slam-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="kornia-slam-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/kornia-slam" "${pkgdir}/usr/bin/kornia-slam"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
