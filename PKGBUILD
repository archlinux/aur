# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-redis
_project=gawkextlib
pkgver=1.7.5
pkgrel=1
pkgdesc="GAWK extension - interface to Redis via hiredis API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('hiredis')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('79978473af0aaaa5b078908bef017c6d')
sha256sums=('b4e097f1d6e57add1b24bf6ef9d417025442efabb8e1a30b1e737a70700680e4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
