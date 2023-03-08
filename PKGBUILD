# Maintainer: Debendra Oli <debendraoli [at] pm [dot] me>

pkgname=ydotool-bin
pkgver=1.0.4
pkgrel=2
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
sha256sums=('eed24445f42112372afcd19b9506e43a9b2e5368c8c910559ee42b61835925c3'
	'b32164d2d9aea8134cab59ca719f04797c938ffce89f1868be0103da81712bbc'
	'e092f5e7e474aec6c980c458046d0ff11b18750b53de2bf0a0aba1ca26e6d58e'
	'326822984a902fa2d476e636a914e2a192ec0fb905aa18173bd8e3f566f24ad6')
install=ydotool.install

package() {
	install -Dm755 "$srcdir/ydotool-release-ubuntu-latest" "$pkgdir/usr/local/bin/ydotool"
	install -Dm755 "$srcdir/ydotoold-release-ubuntu-latest" "$pkgdir/usr/local/bin/ydotoold"
	install -Dm644 "$srcdir/80-uinput.rules" "$pkgdir/etc/udev/rules.d/80-uinput.rules"
	install -dm755 "$pkgdir/usr/lib/systemd/user/"
	install -Dm644 "$srcdir/ydotool.service" "$pkgdir/usr/lib/systemd/user/ydotool.service"
}
