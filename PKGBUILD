pkgname=netwib
pkgver=5.39.0
pkgrel=1
pkgdesc="A network library. It is oriented towards developers."
url="http://www.laurentconstantin.com/en/netw/netwib/"
license=('GPL')
makedepends=('libpcap' 'libnet')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/ntwib/netwib/5.39/netwib-$pkgver-src.tgz")
md5sums=('2ffba612bce15f4e29beb8dd32d1a469')
options=('staticlibs')

build(){
	cd "$pkgname-$pkgver-src/src"
	sed -i -e 's|/local||' -e 's|/man$|/share&|' config.dat
	./genemake
	make
	
}

package(){
	cd "$pkgname-$pkgver-src/src"
	make DESTDIR="$pkgdir/" install
}
