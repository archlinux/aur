# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")

sha256sums_x86_64=('997676a84931b0206e9dcbb387bd58610d53272a961bc7f955c23debf8f7e474')
sha256sums_i686=('334a5370f134bc904507d6142903d74c43fa240f70f28ad978bbc81cf6f36fd5')
sha256sums_arm=('eded6146a8520dacee803c3b878a16694c5a95df6db4dea1ff2a017b4468d3f8')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
