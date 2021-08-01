# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.11.2
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

sha256sums_x86_64=('73a9d4dc3db049ca7e2a4a1084fc783dac5fb2eb17ea29f84b77ab8e1e39aa98')
sha256sums_i686=('8765449a82231289df9fbc454657d2451d7d786a4732e5d089666ede4e3e1cd0')
sha256sums_arm=('ff87141c8811084f5440d8123bb350bee910424ce2bbdc70351aeddc2bc6d793')
sha256sums_armv6h=('ff87141c8811084f5440d8123bb350bee910424ce2bbdc70351aeddc2bc6d793')
sha256sums_aarch64=('ff87141c8811084f5440d8123bb350bee910424ce2bbdc70351aeddc2bc6d793')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
