# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.1.1
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('ae5cee36950ed2410b2c6e993e7b00f8abfe79552030e18efd2c19642ef15293f218928b5b2ff55e37a53aa1719d5fc56a633c87f0829c6539fe6c54b59ccea5')

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
