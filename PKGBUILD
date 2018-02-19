# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.3
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")

sha256sums_x86_64=('0e2416b56b00fdd7f970365ed8a7e2b6e38f5c5d2c94c1fd68a980bcfee1529a')
sha256sums_i686=('598f767b3e914f137cb0e8a0acac1ad72625ad011aa9d6a2d1bf45216a6e8c97')
sha256sums_arm=('c0f2e59e536685bd5c8b8ca70a4fd8bd4becef7eee93b8d733276066e37b8cb2')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
