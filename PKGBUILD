# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.11.4
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

sha256sums_x86_64=('2026b12593e9ec5685d20789413b05fbe45d255f62f9beed3e9e7c7ba91c51b6')
sha256sums_i686=('4f7b59a50038906a40c9a2faee3df05e3296d9f0f02fe6b47260071930c4b151')
sha256sums_arm=('6613d82b52b98cb0893bc3c960784b9b93fb6f5a1d740da918d1fb19ce0fa444')
sha256sums_armv6h=('6613d82b52b98cb0893bc3c960784b9b93fb6f5a1d740da918d1fb19ce0fa444')
sha256sums_aarch64=('6613d82b52b98cb0893bc3c960784b9b93fb6f5a1d740da918d1fb19ce0fa444')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
