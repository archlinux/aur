# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.25.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('6d6c85b23500b3167f80affd4dea6ed71abbee309ffdc9ca1d2689614b2c9d89')
sha256sums_i686=('23cc23c01531ef0c56ac96b7a20033fc08f98876ad7012f14f3b53da6a6c1dfe')
sha256sums_arm=('a8ff925b18799a1e435a76d9839f75716960c590650cce97df6b074fe7040d39')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('990d201fdbd611401183c111f91ea28370067d9796b1b73aff7f35e32a0cbd20')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
