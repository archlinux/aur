# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
 
pkgname='jcal-git'
 
_gitname=jcal
#The real value will be calculated by pkgver() function
pkgver=69.162c703
pkgrel=1
 
pkgdesc="Jalali calendar is a small and portable free software library to manipulate date and time in Jalali calendar system"
url="http://www.nongnu.org/jcal/"
 
arch=('any')
license=('GPL3')
provides=('jcal') 
depends=()
makedepends=('git')
source=('git://github.com/ashkang/jcal.git')
md5sums=('SKIP')
 
 
pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
 
build() {
	cd "${srcdir}/${_gitname}/sources"
	./autogen.sh
	./configure --prefix=/usr
make
}
 
package() {
	cd "${srcdir}/${_gitname}/sources"
	make DESTDIR=$pkgdir install
}
