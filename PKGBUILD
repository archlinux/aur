# Maintainer: Debendra Oli <debendraoli [at] pm [dot] me>

pkgname=ydotool-bin
pkgver=1.0.4
pkgrel=6
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64' 'aarch64')
conflicts=(ydotool)
provides=(ydotool)
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
source=("$url/releases/download/v$pkgver/ydotool-release-ubuntu-latest"
	"$url/releases/download/v$pkgver/ydotoold-release-ubuntu-latest"
	"80-uinput.rules"
	"ydotool.service")
sha256sums=('daa83507a596d6839b7467540382dbdc6e4bf64ebfa4f7d6416e877d9a522c0c'
	'3f14f96308935214c0fb154507360f7632e7deda1935dc2d538259fd9986ed36'
	'e092f5e7e474aec6c980c458046d0ff11b18750b53de2bf0a0aba1ca26e6d58e'
	'aa97efd1dd47b02602b2111fe4c9b32cfd16aa75baf9c2127b3d18ea28c0758f')
install=ydotool.install

package() {
	install -Dm755 "$srcdir/ydotool-release-ubuntu-latest" "$pkgdir/usr/local/bin/ydotool"
	install -Dm755 "$srcdir/ydotoold-release-ubuntu-latest" "$pkgdir/usr/local/bin/ydotoold"
	install -Dm644 "$srcdir/80-uinput.rules" "$pkgdir/etc/udev/rules.d/80-uinput.rules"
	install -dm755 "$pkgdir/usr/lib/systemd/user/"
	install -Dm644 "$srcdir/ydotool.service" "$pkgdir/usr/lib/systemd/user/ydotool.service"
}
