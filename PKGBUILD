# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stest
pkgver=0.6.10
pkgrel=1
pkgdesc='Command line client for speedtest.net written in Rust'
arch=('x86_64')
url=https://github.com/opensourcegeek/stest
license=('unknown')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/$pkgver/stest-$pkgver.tar.gz")
sha512sums=('859640fd6aeb2be59b95d7ae7759ccbd4895216e73a04ef394b17addd77f682b10522f14be62e2a86502df712f7ee24b2460f33643af8032df2813f1583cb837')

build() {
  cd stest-$pkgver
  cargo build --release --locked
}

check() {
  cd stest-$pkgver
  cargo test --release --locked
}

package() {
  cd stest-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/stest
}

# vim:set ts=2 sw=2 et:
