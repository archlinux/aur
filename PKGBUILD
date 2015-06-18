# Maintainer: Alex Jones <alex.theboy.jones@gmail.com>
pkgname=nxt
pkgver=1.5.12
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=()
url="http://nxt.org"
license=('MIT/GPL')
arch=(any)
makedepends=(unzip)
depends=('jre8-openjdk')
optdepends=('flashplugin: for add to clipboard support')
source=(https://bitbucket.org/JeanLucPicard/nxt/downloads/nxt-client-$pkgver.zip)
sha256sums=('ac42f30dde2f84c624a78791befb44ed0f11dc8e456742388d410537914266f9')

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -rf $pkgname $pkgdir/opt
	echo "cd /opt/nxt && bash run.sh" > $pkgdir/usr/bin/nxt
	echo "cd /opt/nxt && bash run-tor.sh" > $pkgdir/usr/bin/nxt-tor	
	chmod 755 $pkgdir/usr/bin/nxt
	chmod 755 $pkgdir/usr/bin/nxt-tor
	mkdir nxt_db
	chmod 777 -R $pkgdir/opt/nxt
}