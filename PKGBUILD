# Maintainer: dobo <dobo90_at_gmail.com>

pkgname=as31
pkgver=2.3.1
pkgrel=2
pkgdesc="An 8031/8051 assembler."
arch=(i686 x86_64)
url=http://wiki.erazor-zone.de/wiki:projects:linux:as31
license=(BSD)
depends=(glibc)
source=(http://wiki.erazor-zone.de/_media/wiki:projects:linux:as31:${pkgname}-${pkgver}.tar.gz)
md5sums=(e70d7a2d6b80dc37082e79480bb2d1da)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	rm as31/parser.c

	chmod +x configure
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install
	
	install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/as31/COPYING
}
