# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.6.1
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('603c33ba1a6feb4e250a65ce07b43b20e3a51b6fc56e55007777fc4d211fd0ce034193b16765599338d14b7255835a5cb71872a648f480cee179d5846bbf0fc6')

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
