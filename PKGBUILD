# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.31.0
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

sha256sums_x86_64=('796dbfc3c00f1312688fd4de2f4002ffd45fb2393d5723755bccb02c52242730')
sha256sums_i686=('697e07264d974a1236fe696f9ac67c0510169522120aa9c5310381c76e91f6a3')
sha256sums_arm=('773c4daa3ea7207c16dea0599489d1a4eec22ee53b3113c7e0938a572346033e')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('869d2686a4d3ef3f87c97d0e324c1b80c39ca65879b89e201b97b4b6bf4a9c55')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
