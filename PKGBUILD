# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=ptpd
pkgver=2.3.1
pkgrel=1
pkgdesc="The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as defined by the relevant IEEE 1588 standard. PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise time coordination of LAN connected computers."
arch=('x86_64' 'i686' 'any')
url="http://ptpd.sourceforge.net/"
license=('BSD')
depends=('libpcap')
provides=('ptpd')
source=("http://sourceforge.net/projects/ptpd/files/ptpd/2.3.1/ptpd-2.3.1.tar.gz/download")
md5sums=('253bab7ab51d969616ea811be1f132f3')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
