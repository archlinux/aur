pkgname=bar_daemon
pkgver=0.2.0
pkgrel=3
pkgdesc="Async status bar daemon for Linux. Uses event-driven updating of values"
arch=('x86_64')
url="https://github.com/tmforshaw/bar_daemon"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez' 'bluez-utils' 'acpi' 'asusctl' 'procps-ng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae104fb5c320c73cc2584470b4ed6c5bb0fbc49f79db0ad095bbee12534722e1')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/bar_daemon "$pkgdir/usr/bin/bar_daemon"
}
