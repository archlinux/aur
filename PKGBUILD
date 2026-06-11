# Maintainer: Quicknode <support@quicknode.com>
pkgname=qn-bin
pkgver=0.1.9
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
sha256sums_x86_64=('1b1e71dab09bede74f74d276ccf9d95814dc9f814e6989b654a3a249f710a0e9')
sha256sums_aarch64=('ea254432f61dd7deb46c033a18a21269343bf071834e7f4189a7a72d9dbc47cd')

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
