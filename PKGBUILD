# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=1.6.0
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('559ff47b0afaf7fdd29ce5692ad6fc995e2b15e5de627dfe066c83e5ccaa1f9e')

build() {
  cd dijo-$pkgver
  cargo build --release --locked
}

package() {
  cd dijo-$pkgver
  install -Dm755 target/release/dijo -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/dijo"
  install -Dm644 "dijo.1" "$pkgdir/usr/share/man/man1/dijo.1"
}
