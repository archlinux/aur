# Maintainer: John Robinson <jbr100uk@gmail>
pkgname=midish
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="Command line-based midi sequencer and filter"
arch=('i686' 'x86_64')
url="http://www.midish.org"
license=('BSD')
groups=()
depends=(alsa-lib readline)
source=("http://www.midish.org/$pkgname.tar.gz")
md5sums=('f79362a2d71de54ba9d996615b486f36')

build() {
	cd "$pkgname"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
