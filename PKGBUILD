# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.4.1
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('9cf965de5e50bd566617ed60af10a1e747ebf5bb80f0c8ff2bc73f4477fcf7f5306195bf7ab114a7b98bb0dead35af02c0bf522d748d8702daa623b8141db2cb')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
