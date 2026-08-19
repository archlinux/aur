# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.39.0
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

sha256sums_x86_64=('6fba7f376b6c6dec49f41b06408930a43ad064cce103c6a2ce5b3d0413a86434')
sha256sums_i686=('387d95f046ec9334e9de63514f96767fdd5dacbae292eb086fdfa0b0da310ec4')
sha256sums_arm=('673913f24ff57ce43e9d25ee451121d4733d188f45f6ab0468983fad85f8cc42')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('829baeff1c07e055cfa132031b1d9f2282ccdf5076258e482caf2fda70aea5d0')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify ${srcdir}/op.sig ${srcdir}/op
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
