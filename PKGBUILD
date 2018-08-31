# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gutenberg
pkgver=0.4.1
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/Keats/gutenberg"
makedepends=(cargo cmake)
license=('MIT')
source=("https://github.com/Keats/gutenberg/archive/v${pkgver}.tar.gz")
sha256sums=('62ece15697dce61d3b31e250eb26d41f4449a61fe0d3457f244343b278f63506')

build() {
  cd gutenberg-$pkgver
  cargo build --release
}

check() {
  cd gutenberg-$pkgver
  cargo test --release
}

package() {
  cd gutenberg-$pkgver
  install -Dm755 target/release/gutenberg "$pkgdir"/usr/bin/gutenberg
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
