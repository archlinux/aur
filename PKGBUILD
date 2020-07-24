# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.1.0
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('95bdd9892256b53500198e3252479a664ebbea61d18be76372562efa4e2274c728803ab83a4c1c308d20c07cb5b8044c0bd8b1220dfdd070b7eb368310bf1e70')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

# Test files not included in crate
#check() {
#  cd $pkgname-$pkgver
#  cargo test --release --locked
#}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
