# Maintainer: Felix Seidel <felix@seidel.me>
# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Liu Yuxuan <betsu@yahoo.com>

pkgname=1password-cli
pkgver=0.4.1
pkgrel=2
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")
source_armv6h=("${source_arm}")

sha256sums_x86_64=('22113980776ed26a0805e6d941fd7bb0a0f394cd0154c23f0de841a1caf68de9')
sha256sums_i686=('d136d890f97351c050c9af3322aeb2b41a19e4983d5721cb7738e24464ba43fb')
sha256sums_arm=('c7a712a25e0c67319c7f6181b4da4feee0028af6cd2100c1cf6a00f75fac6d7e')
sha256sums_armv6h=("${sha256sums_arm}")

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
