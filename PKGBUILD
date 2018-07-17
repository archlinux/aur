# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=1.7
pkgrel=3
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
	"4fbebdf7a442182cfa143c849657182bf2bfbaf81d5c40ea60e81a28bf12d1061e1e4a1a13b27b020d58d41364598925e0d4b53aa23ab937ea7b333f880f864b"
	)
