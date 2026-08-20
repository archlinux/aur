# Maintainer: xscriptor xscriptordev x@xscriptor.com
pkgname=xfetch-bin-cli
pkgver=0.7.0
pkgrel=1
pkgdesc="Custom system information tool for X (Rust) - precompiled binary"
arch=('x86_64' 'aarch64')
url="https://github.com/xfetch-cli/xfetch"
license=('MIT')
depends=('gcc-libs')
provides=('xfetch')
conflicts=('xfetch' 'xfetch-git')
source_x86_64=("https://github.com/xfetch-cli/xfetch/releases/download/v${pkgver}/xfetch-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xfetch-cli/xfetch/releases/download/v${pkgver}/xfetch-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1013e285641e815995946e6389281d0abacadf878468c3aa5acbd3128223ca16')
sha256sums_aarch64=('862543861e2c2a46ef4073fbceba68e8882082d445ce03de904b02fba87430ac')

package() {
  cd "$srcdir"

  install -Dm755 "xfetch" "$pkgdir/usr/bin/xfetch"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
