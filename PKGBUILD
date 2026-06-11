# Maintainer: Quicknode <support@quicknode.com>
pkgname=qn-bin
pkgver=0.1.8
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
sha256sums_x86_64=('1be8a163b5b7593a9181f19fc9f5df7e6062e00e9b0ac491e372d207218d54a1')
sha256sums_aarch64=('fbfa9bfba7128e7a02eb6d7ae6b766cbe68d39051b2a210e14d412d4db24ebea')

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
