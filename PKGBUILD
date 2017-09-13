# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=msim
pkgver=1.3.8.5
pkgrel=1
pkgdesc="Light-weight computer simulator based on MIPS R4000"
url="http://dsrg.mff.cuni.cz/~holub/sw/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
source=("http://d3s.mff.cuni.cz/~holub/sw/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d19b80885357e860b7592e649e6ac418')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	msg "Installing documentation"
	install -d -m 0755 ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/
	install -m 0644 doc/reference.html doc/default.css \
		${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/
}
