# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-redis
_project=gawkextlib
pkgver=1.4.0
pkgrel=1
pkgdesc="GAWK extension - interface to Redis via hiredis API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('hiredis' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('72ba8d3a3c98582162c82b1f9756e9d3')
sha256sums=('08d6be552b8c12025c7739d1b4e6bd9972f2927c2381d0c8d17845b32fc62564')

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
