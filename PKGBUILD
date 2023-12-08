# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=ffapp
pkgver=0.1.0
pkgrel=1
pkgdesc="ffapp is a simple tool for creating and managing Firefox web apps"
arch=("any")
url="https://gitlab.com/neilsimp1/ffapp"
license=("GPL-3-or-later")
depends=("python"
	"python-requests")
source=("https://gitlab.com/neilsimp1/ffapp/-/archive/0.1.0/ffapp-0.1.0.tar.gz"
	"ffapp.sh")
sha256sums=("0af64d822e888c9332b3e943a791e99c48ba8fc944e83c11702dc0ab87fe361e"
	"f6836e872ee684ab42f3fd1ef5affc68923d4716eba0dc6bfdbc0854ae1c9dff")

package() {
	cd "$srcdir"

	install -Dm 755 ffapp.sh "$pkgdir"/usr/bin/ffapp

	cd "$srcdir"/ffapp-"$pkgver"
	mkdir -p "$pkgdir"/usr/share/ffapp
	install -Dm 755 ffapp.py "$pkgdir"/usr/share/ffapp/ffapp.py
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
