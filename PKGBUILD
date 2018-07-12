# Maintainer: Felix Seidel <felix@seidel.me>
# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>
# Contributor: Liu Yuxuan <betsu@yahoo.com>

pkgname=1password-cli
pkgver=0.5
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

sha256sums_x86_64=('f05c00581ad68b271dbb6a946baecd191373bc169d226254677c699ce2cc4021')
sha256sums_i686=('754255fc2e7ceac3470e2cb2ec4994cd1e2e348be0e31cf5a7c9612f6ab721cd')
sha256sums_arm=('a56f4f7a0043868bcfb42503daac08e139874996510ee2613439a0ec44819c1f')
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
