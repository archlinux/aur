# Maintainer: Harley Amundsen dragos240alt@gmail.com

pkgname=ipband
pkgver=0.8.1
pkgrel=1
pkgdesc="IP Bandwdith Watchdog"
arch=('any')
url="http://ipband.sourceforge.net"
license=('GPL')
makedepends=('tar')
depends=('libpcap')

md5sums=('23aa932a6b97be3e831a3f8b31d21e6f')

source=("${url}/${pkgname}-${pkgver}.tgz")

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	cd "${pkgdir}"
	mv "usr/sbin" "usr/bin"
}
