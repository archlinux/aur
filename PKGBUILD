# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.9.0
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

sha256sums_x86_64=('1c06c861b9c6972ddb0d2503f3351de92c1a273b8c937a555b7f75a1c2ddb6ab')
sha256sums_i686=('0bdce582c2e83452f5dc2bc6c69fb3baaeafe34cbf96e4acc8f3a1dc87eb35c7')
sha256sums_arm=('01925fce539f103f023f2fbc7dcafd700c505568d773894bf1ee7e3ad3c0e08c')
sha256sums_armv6h=('01925fce539f103f023f2fbc7dcafd700c505568d773894bf1ee7e3ad3c0e08c')
sha256sums_aarch64=('01925fce539f103f023f2fbc7dcafd700c505568d773894bf1ee7e3ad3c0e08c')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
