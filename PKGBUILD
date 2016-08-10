# Maintainer: Martin Trigaux <me@mart-e.be>
pkgname=nxt
pkgver=1.10.1
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=()
url="https://nxt.org"
license=('MIT/GPL')
arch=(any)
makedepends=(unzip)
depends=('jre8-openjdk')
source=(https://bitbucket.org/JeanLucPicard/nxt/downloads/nxt-client-$pkgver.zip)
sha256sums=('fd4ac1811a7fa968356d0391988c9a08f796748324e8cb43124b7f6b0c683823')

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
