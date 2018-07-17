# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=1.7
pkgrel=1
url=http://www.beroal.in.ua/prg/bittorrent2player/
pkgdesc="Transfers data from the BitTorrent network to another protocol (currently HTTP) which is more suitable for media players."
arch=("any")
license=("LGPL")
depends=("python2" "python2-distribute" "libtorrent-rasterbar>=0.15.7" "desktop-file-utils")
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
	"421dbb6e2557b390de42ae96c4214bff555221e535f91ae8d88109d22a35e1d616d4736513f3c12daf33ad5e4d0d22fd82e9bf7ca3928ce75367b090f6d30376"
	)
