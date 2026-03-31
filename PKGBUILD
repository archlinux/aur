# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.33.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('0fc50cb22d791b5ee5e1421d97e96595fd61ca56ae92271bd1b28bb884971726')
sha256sums_i686=('f111ed559a78ca4e706fac34ef0d03accf2c8b6e02bef10d3da19dea8ad19dd1')
sha256sums_arm=('3d37fae2a73afe39a5fbb5cc6c343f3d4f8a1a3baac4d2641cfc31dc7762888a')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('b4b32cf5860d8353b99429c1fc65d11f2b04a9a2a9f4d06b747b8c07929216f0')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify ${srcdir}/op.sig ${srcdir}/op
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
