# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.12.4
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
source_aarch64=("https://cache.agilebits.com/dist/1P/op/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('35a16122c76bea936383d7597b45bee55e0ea63df94758c3342ff417fb395a87')
sha256sums_i686=('ef10eeb27e4ac4eb586acbf3caff75aa5678bfacdf60186cd519ecd869cc5cc9')
sha256sums_arm=('682ccf8bef44b74c330998549e93f18845d29bcd2b29ef965d0aa16d76fc22e1')
sha256sums_armv6h=('682ccf8bef44b74c330998549e93f18845d29bcd2b29ef965d0aa16d76fc22e1')
sha256sums_aarch64=('1258b4b29a66c825cb69e2eca49ab9e4e0ac7cc068e676eff99d8952ecd0aabf')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
