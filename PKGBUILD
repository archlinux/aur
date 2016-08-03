# Maintainer: Martin Trigaux <me@mart-e.be>
pkgname=nxt
pkgver=1.9.2
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=()
url="https://nxt.org"
license=('MIT/GPL')
arch=(any)
makedepends=(unzip)
depends=('jre8-openjdk')
source=(https://bitbucket.org/JeanLucPicard/nxt/downloads/nxt-client-$pkgver.zip)
sha256sums=('4fe0520e5b4d0fe244dc9d8ab7943c1a107a7e4227ce4ae9f3236ae1dcc1a8ab')

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -rf $pkgname $pkgdir/opt
	echo "#!/bin/sh" > $pkgdir/usr/bin/nxt
	echo "cd /opt/nxt && bash run.sh" >> $pkgdir/usr/bin/nxt
	echo "#!/bin/sh" > $pkgdir/usr/bin/nxt-tor
	echo "cd /opt/nxt && bash run-tor.sh" >> $pkgdir/usr/bin/nxt-tor
	chmod 755 $pkgdir/usr/bin/nxt
	chmod 755 $pkgdir/usr/bin/nxt-tor
	mkdir nxt_db
	chmod 777 -R $pkgdir/opt/nxt
}
