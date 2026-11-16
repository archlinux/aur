# Maintainer: xscriptor xscriptordev x@xscriptor.com
pkgname=xfetch-core-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Custom system information tool for X (Rust) - precompiled binary"
arch=('x86_64' 'aarch64')
url="https://github.com/xfetch-cli/xfetch"
license=('GPL-3.0-only')
depends=('gcc-libs')
provides=('xfetch')
conflicts=('xfetch' 'xfetch-git')
source_x86_64=("https://github.com/xfetch-cli/xfetch/releases/download/v${pkgver}/xfetch-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xfetch-cli/xfetch/releases/download/v${pkgver}/xfetch-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('788dba9b36be886ebab49c3a6cfcbba4e8dcde28d9aa61cf2ada9b5559c01755')
sha256sums_aarch64=('a3963448541b802240a8f193ebc7154f780f1d18e82a58faa8c813abae8da0c7')

package() {
  cd "$srcdir"

  install -Dm755 "xfetch" "$pkgdir/usr/bin/xfetch"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
