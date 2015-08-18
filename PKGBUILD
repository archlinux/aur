# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=libupnpp
pkgver=0.12.1
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('c8472f91a4e08595cd104b5c9fb82eab')
         

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
