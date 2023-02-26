# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=speedtest-rs
pkgver=0.1.4
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c53204efd2f622682fdd53b34f9305bfdba0aacf8ea857c99b07a5ff6c0fe7909489f8ac5e49b32104eb77fba4408db4e73e6c62458b4242cf93e7bd7931da2c')

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
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
