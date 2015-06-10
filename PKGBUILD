# $Id: PKGBUILD 119903 2011-04-16 22:57:07Z bisson $

# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Brad Gordon <brad@rpgcyco.net>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libmcs
pkgver=0.7.2
pkgrel=2
pkgdesc='Library which abstracts the storage of configuration settings'
arch=('i686' 'x86_64')
url='http://www.atheme.org/project/mcs'
license=('BSD')
depends=('libmowgli')
source=("http://distfiles.atheme.org/libmcs-${pkgver}.tbz2")
sha1sums=('20c30bf7d4b3043848b5180de4c2cb61f7e0154c')

build() {
	cd "${srcdir}/libmcs-${pkgver}"
	sed -i "s/libmowgli/libmowgli-2/g" configure
	./configure --prefix=/usr --disable-gconf --disable-kconfig
	make
}

package() {
	cd "${srcdir}/libmcs-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/libmcs/COPYING"
}
