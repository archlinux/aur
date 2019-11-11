# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.17.2
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="http://www.lesbonscomptes.com/upplay/downloads.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(GPL2)
depends=(libupnp expat)
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5abaaf353a1e9c3482d61ef2627b650285d59f27c1ee60d35b8951952261374f')

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
