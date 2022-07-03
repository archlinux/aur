# Maintainer: ChemicalXandco <contact at chemicalxand dot co>

pkgname=openscad-language-server
pkgver=0.1.0
pkgrel=1
pkgdesc="A Language Server Protocol server for OpenSCAD"
arch=('i686' 'x86_64')
url="https://github.com/dzhu/openscad-language-server"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a35c5099e720f052a3dc9c2a8b8d6eaf735ad33f295ff5d75e0b9f6f7200424f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --no-default-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/openscad-language-server

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
