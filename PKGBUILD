# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=yersinia
pkgver=0.7.3
pkgrel=1
pkgdesc="A network tool designed to take advantage of some weakness in different network protocols"
url="http://www.yersinia.net/"
depends=('libpcap' 'libnet')
optdepends=('gtk2: required for the gtk 2.0 interface')
license=("GPL")
arch=('i686' 'x86_64')

source=(http://www.yersinia.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('53ca82d6cb463810b6a205d0e2362784')

build() {
	cd "${srcdir}"
	./configure --prefix=/usr --with-pcap-includes=/usr/include/pcap --disable-gtk
	# Uncomment and replace to enable the gtk2 interface (alpha)
	#./configure --prefix=/usr --with-pcap-includes=/usr/include/pcap	
	make
}

package() {
	cd "${srcdir}"
	make DESTDIR=${pkgdir} install	
}
