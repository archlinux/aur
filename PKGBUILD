# Maintainer: xscriptor xscriptordev x@xscriptor.com
pkgname=xfetch-core-bin
pkgver=1.0.0
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
sha256sums_x86_64=('19259c15cb527f00f29197a753812e9c8b14e276b48e9d61d0d09db7a151d395')
sha256sums_aarch64=('c0f18ff7e4bd5615dd592d90bb6c64d7252da1e043d5f9967d3d36f51c275527')

package() {
  cd "$srcdir"

  install -Dm755 "xfetch" "$pkgdir/usr/bin/xfetch"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
