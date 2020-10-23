# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=1.8.0
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

sha256sums_x86_64=('4f257af9eeeca5d40d099e76e30322afbb44b0d34c052ec4fe3378deadefee68')
sha256sums_i686=('47aa759f074c98c39ede3a3969abe78d574b3589dcdaf2d82532ead3d4ccbfff')
sha256sums_arm=('85dc0dd86eff1fe99715667edadb7be8aab11d42efe66a4096cd995198f1d830')
sha256sums_armv6h=('85dc0dd86eff1fe99715667edadb7be8aab11d42efe66a4096cd995198f1d830')
sha256sums_aarch64=('85dc0dd86eff1fe99715667edadb7be8aab11d42efe66a4096cd995198f1d830')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
