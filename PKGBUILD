# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.10.3
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

sha256sums_x86_64=('3fe76f17cfa25f08c3b482e1c5419b9c8017cf52039c01d2f7ed520fe3f5c0f7')
sha256sums_i686=('e199ebc7cbbd3ac20539008c6ec192b70ee5620736c3ee8f25d0f334863056d5')
sha256sums_arm=('1b62f771ce750697416a627eee77184ade1a2be81e3f126994bbb127e6adbb32')
sha256sums_armv6h=('1b62f771ce750697416a627eee77184ade1a2be81e3f126994bbb127e6adbb32')
sha256sums_aarch64=('1b62f771ce750697416a627eee77184ade1a2be81e3f126994bbb127e6adbb32')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
