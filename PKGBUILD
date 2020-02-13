# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=b3sum
pkgver=0.2.0
pkgrel=1
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=('x86_64')
url=https://github.com/BLAKE3-team/BLAKE3
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("b3sum-$pkgver.tar.gz::https://crates.io/api/v1/crates/b3sum/$pkgver/download")
sha512sums=('7a934ff09f252578df90cdad74ca35e348d14c8b6c6389c1ea11e96c40a360c714979a30bbc8367e233b963c41848e63d1eaa18ccf7e6621ac9c7574449428db')

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
