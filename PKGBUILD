# Contributor: boteium
pkgname=sniffjoke
pkgver=0.4.1
pkgrel=3
license=GPL
pkgdesc="An internet client running SniffJoke injects in the transmission flow some packets able to seriously disturb passive analysis like sniffing, \
interception and low level information theft"
arch=('i686' 'x86_64')
url=http://www.delirandom.net/sniffjoke/
depends=('cmake' 'gcc' 'iptables' 'tcpdump')
source=('http://www.delirandom.net/sniffjoke/sniffjoke-0.4.1.tar.bz2' )

build() {
	cd $srcdir/sniffjoke-0.4.1
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_SBINDIR=/usr/sbin -DSYSCONFDIR=/etc/sniffjoke ..
	make 
}
package(){
	cd $srcdir/sniffjoke-0.4.1/build
	make DESTDIR=$pkgdir install
}
md5sums=('5a916a830abef8b5c26d4f0e38941b40')
