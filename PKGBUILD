# Maintainer: fzerorubigd <fzero{AT}rubi{DOT}gd>
 
pkgname='jcal-git'
 
_gitname=jcal
#The real value will be calculated by pkgver() function
pkgver=v0.4.1.r1.ge4678be
pkgrel=1
 
pkgdesc="Jalali calendar is a small and portable free software library to manipulate date and time in Jalali calendar system"
url="http://www.nongnu.org/jcal/"

arch=('any')
license=('GPL3')
provides=('jcal') 
depends=()
makedepends=('git')
source=('git://github.com/fzerorubigd/jcal.git')
md5sums=('SKIP')
 
 
pkgver() {
	cd "${srcdir}/${_gitname}"
  git describe --tags | sed 's/-/.r/; s/-/./'
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
