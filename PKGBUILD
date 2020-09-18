# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.7.0
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

sha256sums_x86_64=('64a6eaab79f1ebe6dc5e5d7aa1135a5819c7c99f1854e24aadd8abfafb37b97e')
sha256sums_i686=('0eb57f7fd8bf05071f2608ed761f2776f526478081bcfd8fb10bf9329234392e')
sha256sums_arm=('11e707b48dcea2e3d297db8e9396a645db3a24f3726afe359d92b5ac6cedb5a9')
sha256sums_armv6h=('11e707b48dcea2e3d297db8e9396a645db3a24f3726afe359d92b5ac6cedb5a9')
sha256sums_aarch64=('11e707b48dcea2e3d297db8e9396a645db3a24f3726afe359d92b5ac6cedb5a9')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
