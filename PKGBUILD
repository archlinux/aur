# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.9.1
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

sha256sums_x86_64=('861fa9a721111a95fa30919a3d4ccd3333c95c9ad4abcc31263f883bc3fc73e4')
sha256sums_i686=('50cabfcacd520ebb3ba0bbd32a6445acbd1846a4728c8119a08118ebc02f2f07')
sha256sums_arm=('76a6825c16af91901cb24f1892b3e9257edabb745e247cd4e4e9e4c7f7824cc8')
sha256sums_armv6h=('76a6825c16af91901cb24f1892b3e9257edabb745e247cd4e4e9e4c7f7824cc8')
sha256sums_aarch64=('76a6825c16af91901cb24f1892b3e9257edabb745e247cd4e4e9e4c7f7824cc8')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
