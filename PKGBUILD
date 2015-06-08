#Contributor: Hans Janssen <janserv at gmail dot com>

pkgname=fgrun
pkgver=3.4.0
pkgrel=3
pkgdesc="Frontend for FlightGear."
arch=('i686' 'x86_64')
license=('GPL')
depends=('fltk' 'openscenegraph')
makedepends=('git' 'cmake' 'boost' 'simgear')
url="http://sourceforge.net/projects/flightgear/"
source=('fgrun::git+http://git.code.sf.net/p/flightgear/fgrun#branch=release/3.4.0')
sha256sums=('SKIP')
build() {
	cd ${srcdir}/${pkgname}
	cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR="${pkgdir}" install
}
