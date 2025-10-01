# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.32.0
pkgrel=2
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

sha256sums_x86_64=('68e3141b11ad38ba5004fb40d71371b710c0bbf94733f0df9180768336f90097')
sha256sums_i686=('f9a7649d94335e1a5b574822a7040ab9faa58e3c185d85dbf2a88068d5e06829')
sha256sums_arm=('463227b46246fc764c48ec918c2c1c04ffb354d0eeb00a536c1d9f1549a0347c')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('6f3d571aabe7701e21ad4b0f9d30207c3dcabdb2f9c261e3651106dde0ee8946')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify ${srcdir}/op.sig ${srcdir}/op
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
