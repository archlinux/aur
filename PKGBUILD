#Maintainer: Bazza <bazza@riseup.net>

pkgname=('deepmatching')
pkgver=1.2.2
pkgrel=1
pkgdesc="Deep Convolutional Matching"
makedepends=('openmp' 'cblas')
url='https://thoth.inrialpes.fr/src/deepmatching/'
arch=('any')
source=("https://thoth.inrialpes.fr/src/deepmatching/code/deepmatching_1.2.2.zip")
md5sums=('3a1906d9f40c554e5501c61d3d1750a4')
license=('GPL')
options=(!strip)

prepare(){
	cd deepmatching_1.2.2_c++
	sed -i 's/^.*libsatlas.so//' Makefile
	sed -i 's/fopenmp $/fopenmp -lblas/' Makefile
	make
}

package(){
	mkdir -p "${pkgdir}"/usr/bin/
	cp "${srcdir}"/deepmatching_1.2.2_c++/deepmatching "${pkgdir}"/usr/bin/
	chmod 755 "${pkgdir}"/usr/bin/deepmatching
}
