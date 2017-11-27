# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gutenberg
pkgver=0.2.2
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/Keats/gutenberg"
makedepends=(cargo cmake)
license=('MIT')
source=("https://github.com/Keats/gutenberg/archive/v${pkgver}.tar.gz")
sha256sums=('6ae747e791c96591bc8d3b41b1609ce53d06ad384c7db3c96875b5f8f049f72f')

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
