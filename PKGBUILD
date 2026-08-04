# Maintainer: Quicknode <support@quicknode.com>
pkgname=qn-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Command-line interface for the Quicknode SDK'
arch=('x86_64' 'aarch64')
url='https://github.com/quicknode/cli'
license=('MIT')
depends=('glibc')
provides=('qn')
conflicts=('qn')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::https://github.com/quicknode/cli/releases/download/v$pkgver/quicknode-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.xz::https://github.com/quicknode/cli/releases/download/v$pkgver/quicknode-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('02c26a20059e85c8946581ac7ea17a2b24d6c5c6c0f6cbcf9af5ab6714830870')
sha256sums_aarch64=('14f1aaf3fabbcfc86aced81ab737ec2737a80b8dce51be33988a9531ded59953')

package() {
  local archdir
  case "$CARCH" in
    x86_64)  archdir='quicknode-cli-x86_64-unknown-linux-gnu' ;;
    aarch64) archdir='quicknode-cli-aarch64-unknown-linux-gnu' ;;
  esac
  install -Dm755 "$archdir/qn"      "$pkgdir/usr/bin/qn"
  install -Dm644 "$archdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$archdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
