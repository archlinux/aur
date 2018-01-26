# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")

sha256sums_x86_64=('3ba640545e32c94775534dfc8bf036398ad573d0f001492e7f1818e77d183b73')
sha256sums_i686=('71fd9885d28346384dd7833552d7e0f149da0cbe774ad927ffceea8985a7dff0')
sha256sums_arm=('b7cd9c03638ac2369db3b8f95cb2959642b219ed7938f6583561a6c5fc697c3d')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
