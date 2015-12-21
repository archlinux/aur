# Maintainer: Dan Johansen <strit83@gmail.com>

pkgname=opentracker
pkgver=2015.12.21
pkgrel=1
#epoch=
pkgdesc="A free and open torrent tracker"
arch=('x86_64' 'i686' 'armv7h' 'armv7l')
url="http://erdgeist.org/arts/software/opentracker/"
license=('Beerware')
makedepends=('git' 'cvs')
provides=(opentracker)
conflicts=(opentracker)

build() {
	cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
	cd libowfat
	make
	cd ..
	git clone git://erdgeist.org/opentracker
	cd opentracker
	make

}

package() {
	install -dm755 $pkgdir/opt/$pkgname/
	install -dm755 $pkgdir/usr/share/applications/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/$pkgname/$pkgname $pkgdir/opt/$pkgname/$pkgname
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

}
