# Contributor: Rene Wiermer <rwiermer@googlemail>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=frobtads
pkgver=1.2.3
pkgrel=1
pkgdesc="Combined TADS 2 & 3 interpreter and compilers for playing and creating Interactive Fiction games"
arch=('i686' 'x86_64')
url="http://www.tads.org/frobtads.htm"
license=('custom: freeware')
depends=('ncurses' 'curl')
#groups=(tads)
source=(http://www.tads.org/frobtads/${pkgname}-${pkgver}.tar.gz)
md5sums=('c6ed8cd6dac04b3ee6f4422cea688979')


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
