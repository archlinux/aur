# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.34.1
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

sha256sums_x86_64=('b13ed106335419ea0fb0ebd7ebbb3b48cf26a2f214eb4b2fd8d950548e7980ed')
sha256sums_i686=('36216231da9b70c1acf3ef285b948a9dce6f25315f3fbd8863b1fe85f568c57a')
sha256sums_arm=('dc865c93e0d490464627ae6e14fad286f88f75f6fa0b50bf12d224ce78585557')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('fd730a28ffa68376ac62b563d30e20e30ef59d3e2f142d9c6a959cfac5b50f60')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify ${srcdir}/op.sig ${srcdir}/op
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
