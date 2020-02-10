# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.0.13
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('7f23c3951a2823b401a8fa5e62e51110735bc3dc4d2c77370205dacdbe4b1cf9091c39c53c81eb5ddb336a908c5f2566b66a2d7724c3af3f3b1d3e64a01e4831')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

#check() {
#  cd $pkgname-$pkgver
#  cargo test --release --locked
#}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
