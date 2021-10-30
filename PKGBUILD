# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.12.3
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

sha256sums_x86_64=('947df336974f1b16b2fad50fe1621799348a8316758fd733f58b4671f6b08990')
sha256sums_i686=('0227dcfdab0676f0e7616917a78f2096c9b6a87d141a3d71aa69211bd98c7228')
sha256sums_arm=('5468a42e4069f2af259aa41870624509a5d797b775f64d12d065ea911d924c49')
sha256sums_armv6h=('5468a42e4069f2af259aa41870624509a5d797b775f64d12d065ea911d924c49')
sha256sums_aarch64=('5468a42e4069f2af259aa41870624509a5d797b775f64d12d065ea911d924c49')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
