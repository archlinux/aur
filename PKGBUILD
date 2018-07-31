# Maintainer: Felix Seidel <felix@seidel.me>
# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>
# Contributor: Liu Yuxuan <betsu@yahoo.com>

pkgname=1password-cli
pkgver=0.5.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")
source_armv6h=("${source_arm}")

sha256sums_x86_64=('fb7312e9323ee286a8265b62b9ca7f663368b7f41e7d2f49e96927d9620ed7a3')
sha256sums_i686=('05c1d91f14fe21759327238636bd270525373ae4d1bb84d0904edc9ae7393a04')
sha256sums_arm=('303d0be8d1eac69242ca5eb896f2e2e135084f746c60a3d30b3d9eb30e4c87c0')
sha256sums_armv6h=("${sha256sums_arm}")

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
