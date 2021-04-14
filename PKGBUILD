# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.1.2
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('943a86efdb5a0d0cd320aae655653b44aabf9ba280a108f5c35757ea6fde50aed3b00ea17da7b3496621003565d73d3b7ec21076b80b0e0e695e83e732af9814')

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
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
