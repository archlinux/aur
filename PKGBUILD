# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=ffapp
pkgver=0.2.0
pkgrel=1
pkgdesc="ffapp is a simple tool for creating and managing Firefox web apps"
arch=("any")
url="https://gitlab.com/neilsimp1/ffapp"
license=("GPL-3-or-later")
depends=("python"
	"python-requests")
source=("https://gitlab.com/neilsimp1/ffapp/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"ffapp.sh")
sha256sums=("170bf5d7ce8f60d072b6c40ccd5d42dadb9ddecf280c280ede7ce53f16b3ec50"
	"f6836e872ee684ab42f3fd1ef5affc68923d4716eba0dc6bfdbc0854ae1c9dff")

package() {
	cd "$srcdir"

	install -Dm 755 ffapp.sh "$pkgdir"/usr/bin/ffapp

	cd "$srcdir"/ffapp-"$pkgver"
	mkdir -p "$pkgdir"/usr/share/ffapp
	install -Dm 755 ffapp.py "$pkgdir"/usr/share/ffapp/ffapp.py
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
