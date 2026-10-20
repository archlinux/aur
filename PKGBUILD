# Maintainer: w1zx1 <134228659+w1zx1@users.noreply.github.com>
pkgname=pacmanstats
pkgver=0.1.1
pkgrel=2
pkgdesc="TUI for browsing pacman history by day with per-day diff"
arch=('x86_64' 'aarch64')
url="https://github.com/w1zx1/pacmanstats"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/w1zx1/pacmanstats/archive/v$pkgver.tar.gz")
sha256sums=('303d54cdc80933410ca053e4714571f55fe425ba9f8be7cb72c9dbc602563049')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
