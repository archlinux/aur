# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>

pkgname=wine-binfmt
pkgver=1
pkgrel=2
pkgdesc="Register wine interpreter for binfmt"
arch=("any")
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=("Unlicense")
depends=("wine" "systemd")
source=("wine.conf")
sha256sums=('bede63e9e8205c12928491ed47ac96ab2f5c4304ea6d47d0b6f170a1696bbdc6')

package() {
	install -Dm644 "wine.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}

post_install() {
	systemctl restart systemd-binfmt
}

post_remove() {
	systemctl restart systemd-binfmt
}
