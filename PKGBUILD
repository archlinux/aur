# Maintainer: doragasu: doragasu <yawn> hotmail <roll> com

pkgname=sjasm
pkgver="0.42c"
pkgrel=1
pkgdesc="Z80 assembler"
arch=('i686' 'x86_64')
url="http://xl2s.eu.pn/sjasm.html"
license=('Custom')
conflicts=('sjasm')
provides=('sjasm')
source=("git+https://github.com/samsaga2/${pkgname}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	cmake .
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

