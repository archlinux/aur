# Maintainer: xscriptor <x@xscriptor.com>
pkgname=xtop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A TUI system monitor written in Rust for X (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/xtop-cli/xtop"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('xtop')
conflicts=('xtop' 'xtop-git')
source_x86_64=("$url/releases/download/v${pkgver}/xtop-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f96dc9c6ad420702d8fa3787d8e92743ccf4cef3d73c4b806ab34ff6934b9232')
source_aarch64=("$url/releases/download/v${pkgver}/xtop-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a5de21055b399062bf5c868ba296bdf651f869c16957474f6d339e8db19adc44')

package() {
  install -Dm755 "$srcdir/xtop" "$pkgdir/usr/bin/xtop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
