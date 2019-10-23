# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=0.2.0
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=(MIT)
makedepends=(cargo rust-nightly cargo-nightly)
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/${pkgver}.tar.gz)
sha512sums=('8a2c0a40194d1843d85c1985d3d2ad54cc7e917f996dfd9f8181f73dba87946feffb3ab70f69f568621d712874a5d65e68b6ca2eadc6f5a0cd933e9345d1e5ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo +nightly build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proby "$pkgdir"/usr/bin/proby
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
