# Maintainer: John Robinson <jbr100uk@gmail.com>
pkgname=midish
pkgver=1.3.1
pkgrel=1
epoch=1
pkgdesc="Command line-based midi sequencer and filter"
arch=('i686' 'x86_64')
url="http://www.midish.org"
license=('BSD')
groups=()
depends=(alsa-lib readline)
source=("http://www.midish.org/$pkgname-$pkgver.tar.gz")
md5sums=('cdaf8e604c483facca00015d1f0aa5e3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
