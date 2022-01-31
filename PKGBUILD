# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-gash
pkgver=0.2.0
pkgrel=2
pkgdesc='POSIX-compatible shell and Guile library for parsing shell scripts.'
arch=(any)
license=(GPL3)
depends=('guile>=2.0.9')
url=https://savannah.nongnu.org/projects/gash/
options=(!strip)
source=( http://download.savannah.nongnu.org/releases/gash/gash-${pkgver}.tar.gz{,.sig} )
validpgpkeys=( D6B0C593DA8C5EDCA44C7A58C33691F71188B004 )
md5sums=('63e1759700bfe7844f8ed91c33a57aed'
         'SKIP')

build(){
	cd "$srcdir/gash-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/gash-$pkgver"
	make check
}

package() {
	cd "$srcdir/gash-$pkgver"
	make DESTDIR=$pkgdir install
}
