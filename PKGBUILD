# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.16.0
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f566751bb7e7742c060d3238ca02b7fddd9b963256c2589e434a21db77be719758992f92a3b42480cb00da09d4ee0bb15f8634c9706eb6f2b738f001c0d81ce0')

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
