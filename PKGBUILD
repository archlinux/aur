# Maintainer: w1zx1 <134228659+w1zx1@users.noreply.github.com>
pkgname=pacmanstats
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for browsing pacman history by day with per-day diff"
arch=('x86_64' 'aarch64')
url="https://github.com/w1zx1/pacmanstats"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/w1zx1/pacmanstats/archive/v$pkgver.tar.gz")
sha256sums=('c3c13e4e9fe111221bb503d8e12d3a709b6eda323d2e58adfac68ef0d1765c57')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
