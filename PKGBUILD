# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu
pkgver=0.3.2
pkgrel=1
pkgdesc="Highly configurable power menu using the wofi launcher power-menu"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('382f00ca63d74eec6da523b45be78345bc8bbc2e93d16de8b252f07cb5334369')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/wofi-power-menu" "$pkgdir/usr/bin/wofi-power-menu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

