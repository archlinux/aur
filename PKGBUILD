# Maintainer: Felix Seidel <felix@seidel.me>
# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>
# Contributor: Liu Yuxuan <betsu@yahoo.com>

pkgname=1password-cli
pkgver=0.5.2
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

sha256sums_x86_64=('ac8162f708cc079264f91318eaeb7f54a6cf319c50c51444e565f08932f25f4c')
sha256sums_i686=('cc5ff4df7ba75eb8225ad3419a33f55ed66eefb5f67499fdd10f97c93573aee6')
sha256sums_arm=('8f7f334985897c88c8a8601735026e429a0c533ad4b6ba504721145d49cac9b3')
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
