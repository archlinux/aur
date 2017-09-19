# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.15.3
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libupnp' 'expat' 'curl')
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('8af255b4da4dc46eeb3690a3cac6d0b3')

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
