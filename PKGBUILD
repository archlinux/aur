# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-redis
_project=gawkextlib
pkgver=1.7.4
pkgrel=1
pkgdesc="GAWK extension - interface to Redis via hiredis API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('hiredis')
makedepends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('71f2cfd11210cc586d4029bab1eb5aa5')
sha256sums=('bbd672eb026e534ec1488ddfd7a5df5b2a6025d8e5c3fa7a5a3162f91ddb7e70')

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
