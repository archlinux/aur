# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=libupnpp
pkgver=0.14.0
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('1b10905a365fc6277e1d8ced77278666')
         

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
