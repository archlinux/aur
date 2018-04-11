# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.4
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")

sha256sums_x86_64=('421ca41fa376a6a6bc8e314c83959872e4658c5fbd3a20c0bf83a50922326b0b')
sha256sums_i686=('e0ac90259ec0e49b517ca2afd3122523553c98f186af2f1fa0dfa18a989f3d43')
sha256sums_arm=('0c32633587325e3874c19ba5e6e658eb1ba8b3354c15c3c9da3f9d9ef849d8ca')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
