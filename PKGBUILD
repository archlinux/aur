# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=b3sum
pkgver=0.3.0
pkgrel=1
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=('x86_64')
url=https://github.com/BLAKE3-team/BLAKE3
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("b3sum-$pkgver.tar.gz::https://crates.io/api/v1/crates/b3sum/$pkgver/download")
sha512sums=('3da4ea06e2db87f37c0f2f2f7b7c016bd25a8b692f96e2927094c3331b2ee494a8db13850720783db67a3965fd7de9928b80feeb0e24bd1ef4cf2b917ddbc091')

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
}

# vim:set ts=2 sw=2 et:
