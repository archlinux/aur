# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=libupnpp
pkgver=0.13.0
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('757b3acb348e13212488a07b23d8e2df')
         

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
