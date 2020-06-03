# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=1.9
pkgrel=1
url=http://www.beroal.in.ua/prg/bittorrent2player/
pkgdesc="Transfers data from the BitTorrent network to another protocol (currently HTTP) which is more suitable for media players."
arch=("any")
license=("LGPL")
depends=("python2" "python2-distribute" "libtorrent-rasterbar>=1.2.6" "desktop-file-utils")
makedepends=()
backup=("etc/bittorrent2player/logging.conf")
install=_.install
source=("http://www.beroal.in.ua/prg/$pkgname/src/$pkgname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
}

sha512sums=( \
	"700545f6fee8c51f7f860b168234799be9c1c2057be317f6bc25268ecd3d0278c8977d8ea6111113f6b96c297c9b2649e5b86f71f8285d2b68f80c157a509eb4"
	)
