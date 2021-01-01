# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=2.0
pkgrel=1
url=http://www.beroal.in.ua/prg/bittorrent2player/
pkgdesc="Transfers data from the BitTorrent network to another protocol (currently HTTP) which is more suitable for media players."
arch=("any")
license=("LGPL")
depends=("python" "libtorrent-rasterbar>=1.2.6" "desktop-file-utils")
makedepends=("python-setuptools")
backup=("etc/bittorrent2player/logging.conf")
install=_.install
source=("http://www.beroal.in.ua/prg/$pkgname/src/$pkgname-$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha512sums=( \
	"d86677d17101b6ff30efbd2ca56ebd633a2b956541b754b9011a9c3e85df38a944e1e352a9c4f8e119c5751921ee48849799d43930bced4dc062f41a1d792f89" \
	)
