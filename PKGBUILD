# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: KingofToasters <dev at sgregoratto dot me>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.6.1
pkgrel=1
url=https://kristaps.bsd.lv/sblg
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
license=(ISC)
arch=(x86_64 i686 armv6h armv7h aarch64)
sha512sums=('07de1388853614ec338353a7eee7dd11e33714f05e77ca503052a8c0530048076c1b0b6aa9fea65e32e6f061071a0522d6aa5aeeb8466bab82c24e9e8dcbb5b1')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX="/usr" MANDIR="/usr/share/man" LDFLAGS="$LDFLAGS -s"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
}
