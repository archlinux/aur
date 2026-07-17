# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=1.4.0
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('60344a6a8d50517dac6bad4b788f09a3ca9db00f26c0c6055988679388553ade')

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
