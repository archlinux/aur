# Maintainer: xscriptor xscriptordev x@xscriptor.com
pkgname=xfetch-core-bin
pkgver=1.0.2
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
sha256sums_x86_64=('64b232fadd3fa242948f1be616421e81a7dcd78658bca33102a904c5c6cfe243')
sha256sums_aarch64=('ecb8fac4e5954ad2352b97e4edb70dd82e307e1ffef323db26d995d05a64d187')

package() {
  cd "$srcdir"

  install -Dm755 "xfetch" "$pkgdir/usr/bin/xfetch"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
