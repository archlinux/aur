# Maintainer: xscriptor <x@xscriptor.com>
pkgname=xtop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI system monitor written in Rust for X (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/xtop-cli/xtop"
license=('MIT')
depends=('gcc-libs')
provides=('xtop')
conflicts=('xtop' 'xtop-git')
source_x86_64=("$url/releases/download/v${pkgver}/xtop-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d6cf49f622bb77d8ec998db4eb5ac389bbd515989368de1b97f294bb2ef1150e')
source_aarch64=("$url/releases/download/v${pkgver}/xtop-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('f47dc5ca1dc9a8a20c64cc2c0c5d73f84055af3668d98f577f155d98793df96b')

package() {
  install -Dm755 "$srcdir/xtop" "$pkgdir/usr/bin/xtop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
