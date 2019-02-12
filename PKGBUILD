# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.6.0
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('89ce0d41677d49a0ad6274dc36d93698473bc9b29e26e6bba76b7fffa80323aa66d815b0f04132485eed330185a55e8a228d7864a047dd9cd8ff0c3a7d6ebbba')

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

check() {
  cd broot-$pkgver
  cargo test --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
