# Maintainer: David Lishcyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu
pkgver=0.2.9
pkgrel=2
pkgdesc="Highly configurable power menu using the wofi launcher power-menu"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b896d8514e9b55c9bfae5dba7908076e6c68e2e6b6c986d3d6f0631621e4079')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/wofi-power-menu" "$pkgdir/usr/bin/wofi-power-menu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

