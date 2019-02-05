# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.5.2
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('0b3c67e17aa1d3c04b84044f7484e5e15e931198a95d9da72ba06c0d0925a6c0bf0742438e73ea5aae93982cf7e2f823ea042c23c265f186721e4cf573d827af')

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

check() {
  cd broot-$pkgver
  cargo test --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
