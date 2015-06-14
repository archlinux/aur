# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >

pkgname=mfile
pkgver=1.0.7
pkgrel=1
pkgdesc="System independent reading and writing of n-dimensional spectra"
url="http://www.ikp.uni-koeln.de/misc/doc/Tv_user-manual/node223.html"
arch=('x86_64' 'i686')
license=('custom') 
depends=('glibc')
options=('!emptydirs')

source=("http://www.ikp.uni-koeln.de/src/lib${pkgname}-${pkgver}.tar.gz")
md5sums=('558259d6fd032f7ad99afe365fb355f8')

build() {
	cd ${srcdir}/lib${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	  cd ${srcdir}/lib${pkgname}-${pkgver}
	  make DESTDIR=${pkgdir} install

	  install -Dm644 ${srcdir}/lib${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
