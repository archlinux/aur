# Maintainer: xscriptor xscriptordev x@xscriptor.com
pkgname=xfetch-core-bin
pkgver=1.0.3
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
sha256sums_x86_64=('f5c77538b9c2b7535ab1e3457d721bc387b76b89158388dc1834c53761cb35e5')
sha256sums_aarch64=('f447aad62e77636b3a515c30418cd57ebefca2c3fedae576bfec500123beff47')

package() {
  cd "$srcdir"

  install -Dm755 "xfetch" "$pkgdir/usr/bin/xfetch"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
