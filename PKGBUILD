# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
 
pkgname='saaghar-git'
 
_gitname=Saaghar
#The real value will be calculated by pkgver() function
pkgver=380.3dbbb51
pkgrel=1
 
pkgdesc="“Saaghar” (ساغر) is a Persian poetry software written by C++ under Qt framework, it uses "ganjoor" database as its database. It has tab feature in both its “Viewer” and its “Search” page that cause it be suitable for research goals."

url="http://saaghar.pozh.org"
 
arch=('any')
license=('GPL3')
 
depends=('qt5-base>=5.3.1')
makedepends=('git')
source=('git://github.com/srazi/Saaghar.git')
md5sums=('SKIP')
 
 
pkgver() {
	cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
 
build() {
	cd "${srcdir}/${_gitname}"
	qmake
	make
}
 
package() {
	cd "${srcdir}/${_gitname}"
	INSTALL_ROOT=${pkgdir} make install
}
