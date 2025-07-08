# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=0.3.2
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0f72a2760114ba802ac50cb15b6fd2df588a6a2373577a994363783412b01ab6')

build() {
	cd dijo-$pkgver
	cargo build --release --locked
}

package() {
	cd dijo-$pkgver
	install -Dm755 target/release/dijo -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/dijo"
}
