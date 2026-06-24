# Maintainer: Quicknode <support@quicknode.com>
pkgname=qn-bin
pkgver=0.2.1
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
sha256sums_x86_64=('4cc1104c45e609235bd371db9c75daee6c7c5154b1d810b0e8bbaf06303eab0e')
sha256sums_aarch64=('e57e912a60ad560a7f9f84aab0db903990248d2f035c881ef7010b6e3e92045f')

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
