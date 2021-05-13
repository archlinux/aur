# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.9.2
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("${source_arm}")

sha256sums_x86_64=('8b326be1cdb91b23870e18be1e087eddab054cfac5f4ff98d26f0694de8521a3')
sha256sums_i686=('0a81f536922161386860c891fac0c70d3c9c054e7fa1cdd0adf5b88050078b9a')
sha256sums_arm=('49b6de8d761c5ef94855da9c5ecf4b760a8c3d015a787438ea947d99664077ee')
sha256sums_armv6h=('49b6de8d761c5ef94855da9c5ecf4b760a8c3d015a787438ea947d99664077ee')
sha256sums_aarch64=('49b6de8d761c5ef94855da9c5ecf4b760a8c3d015a787438ea947d99664077ee')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
