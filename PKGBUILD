# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.32.1
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

sha256sums_x86_64=('64a49db2d1b0333f3bee88546e3e84995e530e25f2c783fb5d4081d01a05b2a1')
sha256sums_i686=('2145fe4f8e191b1fb6b853f354759456aa3836db18c70f48dabe1b3a3449c462')
sha256sums_arm=('38ded46961a5207bc7b8039bbd71bf995ad9cff74c54ff3cf87ad087632683fb')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('cf6d114b12079ba5ac4f3ea6c69d331c06565c361aeae77f8c20868bd94c9885')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify ${srcdir}/op.sig ${srcdir}/op
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
