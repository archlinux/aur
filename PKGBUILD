# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.12.2
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

sha256sums_x86_64=('5aab7a634d29b37b680e766b0dfc649892f2f8fa456c5aa7a5a913a7ad11b4ca')
sha256sums_i686=('bf22041f4f08702ba91535837b377be0e18945121d0fd999add4826aabeb2074')
sha256sums_arm=('fc9c4ad10528b3436211fa442d81ecb357ee1b87591ac551deca930843736ca5')
sha256sums_armv6h=('fc9c4ad10528b3436211fa442d81ecb357ee1b87591ac551deca930843736ca5')
sha256sums_aarch64=('fc9c4ad10528b3436211fa442d81ecb357ee1b87591ac551deca930843736ca5')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
