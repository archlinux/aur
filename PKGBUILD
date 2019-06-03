# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Programs to manipulate Embedded OpenType fonts (eotinfo, mkeot)'
pkgname=eot-utilities
pkgver=1.1
pkgrel=1
url=https://www.w3.org/Tools/eot-utils
arch=(x86_64)
license=(custom)
depends=(glibc)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('fc5f8cb2241b87baa596d50cdda2629d9c8030125d9899ed2f98003d4f1fb292c58652519ae1f6912b6a4ed0475770cbb4653978409684622427bab788b8506a')

build ()
{
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package ()
{
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
