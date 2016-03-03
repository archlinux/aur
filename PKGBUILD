# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=libupnpp
pkgver=0.14.1
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('2092635a6681447a696cb2e945d51b8a')
         

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
