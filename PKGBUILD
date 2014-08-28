# Contributor: tantalum <tantalum at online dot de>
pkgname=g-wrap
pkgver=1.9.14
pkgrel=1
pkgdesc='G-Wrap is a tool, and guile library, for generating function wrappers for inter-language calls'
arch=(i686 x86_64)
license=(LGPL2)
depends=('guile>=1.8.5' 'guile-lib>=0.1.2' libffi)
url='http://www.nongnu.org/g-wrap/'
source=("http://savannah.nongnu.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(fef7ec5e2ff5192221ed6e97fe93bcb9)

build() {
		
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --disable-Werror||return 1

	make ||return 1
	make DESTDIR=${pkgdir} install ||return 1

	#remove documentation
	if [ -e ${pkgdir}/usr/share/info/dir ]; then
		rm ${pkgdir}/usr/share/info/dir
	fi
}
