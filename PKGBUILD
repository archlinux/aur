# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.11.0
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

sha256sums_x86_64=('aab6b9efc6dccb9bb39fcfd5391e19992873f2105867d9b7c4e461816049ade9')
sha256sums_i686=('0c60b8c3a0e76297260730115f3c1e02f245564543516eca6710a1fb1558a09e')
sha256sums_arm=('f8bc8e10dd803c4f000bd1fa448263807b47aac02859c4dbff14bd23693f892a')
sha256sums_armv6h=('f8bc8e10dd803c4f000bd1fa448263807b47aac02859c4dbff14bd23693f892a')
sha256sums_aarch64=('f8bc8e10dd803c4f000bd1fa448263807b47aac02859c4dbff14bd23693f892a')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
