# Maintainer: David Lishcyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu
pkgver=0.3.0
pkgrel=1
pkgdesc="Highly configurable power menu using the wofi launcher power-menu"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('504c93c7cc21278b7fe92708d525badf2006f6c9f8113f1f36069586d1c224da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/wofi-power-menu" "$pkgdir/usr/bin/wofi-power-menu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

