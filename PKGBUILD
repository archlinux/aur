# Maintainer: Debendra Oli <mail@debendra.me>

pkgname=ydotool-bin
pkgver=1.0.4
pkgrel=10
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64' 'aarch64')
conflicts=(ydotool)
provides=(ydotool)
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
source=("ydotool-$pkgver::$url/releases/download/v$pkgver/ydotool-release-ubuntu-latest"
	"ydotoold-$pkgver::$url/releases/download/v$pkgver/ydotoold-release-ubuntu-latest"
	"80-uinput.rules"
	"ydotoold.service")
sha256sums=('daa83507a596d6839b7467540382dbdc6e4bf64ebfa4f7d6416e877d9a522c0c'
	'3f14f96308935214c0fb154507360f7632e7deda1935dc2d538259fd9986ed36'
	'e092f5e7e474aec6c980c458046d0ff11b18750b53de2bf0a0aba1ca26e6d58e'
	'96252bd7c975f84ece83b6acc05bad65f6a7265362b82a79b1d924dd017f4cab')
install=ydotool.install

package() {
	cd "$srcdir/"
	install -Dm755 "$srcdir/ydotool-$pkgver" "$pkgdir/usr/bin/ydotool"
	install -Dm755 "$srcdir/ydotoold-$pkgver" "$pkgdir/usr/bin/ydotoold"
	install -Dm644 "$srcdir/80-uinput.rules" "$pkgdir/etc/udev/rules.d/80-uinput.rules"
	install -dm755 "$pkgdir/usr/lib/systemd/user/"
	install -Dm644 "$srcdir/ydotoold.service" "$pkgdir/usr/lib/systemd/user/ydotoold.service"
}
