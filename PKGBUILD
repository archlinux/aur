# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.10.0
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

sha256sums_x86_64=('a55bf2d142481d8e15bf195db7263b7838acdd055812f14dd80ec827b903437e')
sha256sums_i686=('9ef1c8a8c79d888cd1f1dfa1fc9c2d09bcc411ddf35c91520e7454239f0938f5')
sha256sums_arm=('ac1b417ccda790f02c3f8fcf91e5ec0d5fe2d0ab3b8e7457ece952ecd78a8bb5')
sha256sums_armv6h=('ac1b417ccda790f02c3f8fcf91e5ec0d5fe2d0ab3b8e7457ece952ecd78a8bb5')
sha256sums_aarch64=('ac1b417ccda790f02c3f8fcf91e5ec0d5fe2d0ab3b8e7457ece952ecd78a8bb5')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
