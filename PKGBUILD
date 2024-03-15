# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.25.1
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

sha256sums_x86_64=('014a6659343595fcb06738114699f1e6cc49d6267922166f716a6efcb2471480')
sha256sums_i686=('dc5a9a17e3fdbbf7f1e55479b6ff7d5537f81cc2b90d484c72a515aabf726ac9')
sha256sums_arm=('4717c5d2b3a12daf45e635131206fdcf3e0c33f5723ee07a4b5340eabc23c84e')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('fd9510ff63857d150c96f6ca8b6bc38a249ca8827c2c43d2677f982cc1f80804')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
