# Maintainer: Debendra Oli <debendraoli [at] pm [dot] me>

pkgname=ydotool-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64' 'aarch64')
depends=('libevdevplus' 'libuinputplus')
conflicts=(ydotool)
provides=(ydotool)
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
source=("$url/releases/download/v$pkgver/ydotool-release-ubuntu-latest"
	"$url/releases/download/v$pkgver/ydotoold-release-ubuntu-latest"
	"80-uinput.rules")
sha256sums=('1af0434e65da28e2b688afcdcb983bc54436e178cbf9346611cd0239e0f2a598'
	'b32164d2d9aea8134cab59ca719f04797c938ffce89f1868be0103da81712bbc'
	'e092f5e7e474aec6c980c458046d0ff11b18750b53de2bf0a0aba1ca26e6d58e')
install=ydotool.install

package() {
	install -Dm755 ydotool-release-ubuntu-latest "$pkgdir/usr/bin/ydotool"
	install -Dm755 ydotoold-release-ubuntu-latest "$pkgdir/usr/bin/ydotoold"
	install -Dm644 80-uinput.rules "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
