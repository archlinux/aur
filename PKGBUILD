
# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-mserver
pkgver=0.20.0
pkgrel=1
pkgdesc="Stream music files to your mpd that are not in your database."
arch=(i686 x86_64)
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_MSERVER"
license=("GPL2")
depends=('gmpc>=0.15.4.102' 'taglib' 'libmicrohttpd')
makedepends=('intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('dfc4872f1258a10819eec3f99562637b77fd745fb2a5cbdaf88c2c3e4e107052')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make CFLAGS="${CFLAGS} -DHAVE_STRNDUP"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
