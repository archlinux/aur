# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=b3sum
pkgver=0.1.0
pkgrel=1
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=('x86_64')
url=https://github.com/BLAKE3-team/BLAKE3
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("b3sum-$pkgver.tar.gz::https://crates.io/api/v1/crates/b3sum/$pkgver/download")
sha512sums=('fba4d71ffa84cb4b7b1ce968e48ded1143915e82cfbef4a7a6f1b8a4e97a25f9a3490a13b157f437ad18401b7c545d1fcdbf2032f72e29dba0c8d504e415b481')

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
