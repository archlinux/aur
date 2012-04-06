# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-rtt
pkgver=1.10.4
pkgrel=1
pkgdesc="The RealTime Toolkit is a C++ framework for the implementation of control systems"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
depends=('boost')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/rtt/v${pkgver}/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('c82b577966ec79c7f6b9d9d70a187ef6')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
}

