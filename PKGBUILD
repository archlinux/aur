# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.12.1
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

sha256sums_x86_64=('dfbd96b5165593797b5f16f055c662c7736afe09628de783eab89b4783da6b93')
sha256sums_i686=('c2f9c558b628cd0878067a9254d47fefc0c9d223d7246a8fa4e9041948ae41fd')
sha256sums_arm=('942e91a1b616a5975b1c1479ae96426c8c94fb783d3ea70d2b2fc2c4ecd6632d')
sha256sums_armv6h=('942e91a1b616a5975b1c1479ae96426c8c94fb783d3ea70d2b2fc2c4ecd6632d')
sha256sums_aarch64=('942e91a1b616a5975b1c1479ae96426c8c94fb783d3ea70d2b2fc2c4ecd6632d')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
