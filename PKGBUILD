# Maintainer: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=acme
pkgver=091
pkgrel=2
pkgdesc="A free crossassembler, that can produce code for the 6502, 65c02 and 65816 processors."
arch=('i686' 'x86_64')
url="http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme"
license=('GPL')
source=(http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/${pkgname}/current/${pkgname}${pkgver}src.tar.bz2)
md5sums=('5f7af22cc82307b8e9b29a0314a01b76')
depends=('glibc')

build() {
	cd "${srcdir}/${pkgname}${pkgver}/src"
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}${pkgver}/src"
	install -D -m755 acme ${pkgdir}/usr/bin/acme
}
