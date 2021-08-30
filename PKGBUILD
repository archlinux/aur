# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.11.3
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

sha256sums_x86_64=('68bab915ae0ae2ac10fd21c18eed9482b88354f6025efba1ca4b592d003c985f')
sha256sums_i686=('4aa3b7b478fd36ef7e27d9f680b61eb26885774e9648be5b810fd2ea411bac98')
sha256sums_arm=('10b21e14df6ed94d1260c5e893b3410bfa46e2db8d65ea64e999cae7bacaabcb')
sha256sums_armv6h=('10b21e14df6ed94d1260c5e893b3410bfa46e2db8d65ea64e999cae7bacaabcb')
sha256sums_aarch64=('10b21e14df6ed94d1260c5e893b3410bfa46e2db8d65ea64e999cae7bacaabcb')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
