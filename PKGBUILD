# Maintainer: jtaw <213313463+jtaw5649 at users dot noreply dot github dot com>
pkgname=hyprspaces
pkgver=1.0.0
pkgrel=1
pkgdesc="Paired dual-monitor workspace management for Hyprland"
arch=('x86_64')
url="https://github.com/jtaw5649/hyprspaces-rs"
license=('GPL3')
depends=('hyprland')
optdepends=('waybar: optional Waybar custom module output')
makedepends=('cargo')
install=hyprspaces.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	cargo build --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver" || return 1

	install -Dm755 target/release/hyprspaces "$pkgdir/usr/bin/hyprspaces"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
