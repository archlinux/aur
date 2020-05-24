# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=b3sum
pkgver=0.3.4
pkgrel=1
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=('x86_64')
url=https://github.com/BLAKE3-team/BLAKE3
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("b3sum-$pkgver.tar.gz::https://crates.io/api/v1/crates/b3sum/$pkgver/download")
sha512sums=('35fb4c821d7a9ef08c10f4bf31ddae229c16bd2fe83ebf8592a5d8e015c6080facde41385a97e1d93a6df3da026e92bcf2bb3caf4a17dc7c832dbb5b39b0b2c1')

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
