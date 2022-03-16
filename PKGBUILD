# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.0.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('5087e99c8b0bde941ef34034009fe289b5c2f5b36da3a2c2fa24a2b5a2497083')
sha256sums_i686=('fa922e35b24c784f06fffd23ab5aef710b132a8d952dd8cf8d58e98423625000')
sha256sums_arm=('d2977e252a4ca650a43a2578fdf5d4d4d024eab4b3191890457c890ba34fcba9')
sha256sums_armv6h=('d2977e252a4ca650a43a2578fdf5d4d4d024eab4b3191890457c890ba34fcba9')
sha256sums_aarch64=('dce1481a66b5e537b38a0a9d76a3306cb28a8ec00920bd2c142f8d08075bc751')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
