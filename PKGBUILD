# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=fcat
pkgver=0.1.0
pkgrel=1
pkgdesc="cat implementation in Rust using Linux' splice syscall"
arch=('x86_64')
url=https://github.com/mre/fcat
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("fcat-$pkgver.tar.gz::https://crates.io/api/v1/crates/fcat/$pkgver/download")
sha512sums=('e4a588bbc3be0ed2ba5e306a6d5f22773572823e9f8aed07f67e10715b9bd85f4fe1fdfcac14fad084169799280de1cc6be5600f08dcbcec0dd8cfae9b9fbcee')

build() {
  cd fcat-$pkgver
  cargo build --release
}

check() {
  cd fcat-$pkgver
  cargo test --release
}

package() {
  cd fcat-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/fcat
  install -Dm644 -t "$pkgdir"/usr/share/licenses/fcat LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
