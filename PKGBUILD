# Maintainer: Nikola Brezovec <ShiNoNeko47@proton.me>
pkgname=reel_hub
pkgver=1.4.0
pkgrel=1
pkgdesc="Gtk movie library browser written in rust"
arch=("x86_64")
url="https://github.com/ShiNoNeko47/reel_hub"
license=('MIT')
depends=("cairo" "gcc-libs" "gdk-pixbuf2" "glib2" "glibc" "gtk3" "openssl" "pango" "mpv")
makedepends=("rust")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/ShiNoNeko47/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('eaef284343d5098393e4fc6e48a4f211')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/reel_hub "$pkgdir/usr/bin/reel_hub"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 reel_hub.desktop "$pkgdir/usr/share/applications/reel_hub.desktop"
}
