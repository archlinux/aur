#Maintainer: John Robinson <jbr100uk@googlemail>
# Contributor: Rene Wiermer <rwiermer@googlemail>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=frobtads
pkgver=1.2.4
pkgrel=1
pkgdesc="Combined TADS 2 & 3 interpreter and compilers for playing and creating Interactive Fiction games"
arch=('i686' 'x86_64')
url="http://www.tads.org/frobtads.htm"
license=('custom: freeware')
depends=('ncurses' 'curl')
#groups=(tads)
source=(https://github.com/realnc/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d4a5b8863664998fb989f3fdd2f63de6')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 tads3/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
