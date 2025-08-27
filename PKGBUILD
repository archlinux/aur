# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=0.4.4
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd7c06c309f95b5b23b64429e10b9b120ae131b94955df370cf7bb3fac7a3802')

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
