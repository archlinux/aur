# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=yersinia
pkgver=0.8.2
pkgrel=1
pkgdesc="A network tool designed to take advantage of some weakness in different network protocols"
url="https://github.com/tomac/yersinia"
depends=('libpcap' 'libnet')
optdepends=('gtk2: required for the gtk 2.0 interface')
license=("GPL")
arch=('i686' 'x86_64')

source=(https://github.com/tomac/yersinia/archive/v$pkgver.tar.gz)
md5sums=('b8f37e057698e89963ab7a2c936a3839')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	./configure --prefix=/usr --disable-gtk
	# Uncomment and replace to enable the gtk2 interface (alpha)
	#./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	make DESTDIR=${pkgdir} install	
}
