# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgdesc='Command line tool to make bootable FAT file systems'
pkgname=makebootfat
pkgver=1.6
pkgrel=2
url=https://github.com/amadvance/makebootfat
license=(GPL-2.0-only)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git automake)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5c6d69bc629914393e6b75f4102687b47921fb547969565aa39054aaa917b690cf60b2015d85ba5f7510d4a8b4402d20569d62352675592e23aed9e591061a91')

build () {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
