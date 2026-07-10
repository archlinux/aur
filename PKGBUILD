# Maintainer: Quicknode <support@quicknode.com>
pkgname=qn-bin
pkgver=0.5.0
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
sha256sums_x86_64=('84572f6d2bb5cfabfa3a2a35c7cb8eedef10055e6b19d7773eb6b3b827857332')
sha256sums_aarch64=('5b30dc2b9d0a08c467c26b1f4460fde42fd8752e4190da6e695f6105b5929962')

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
