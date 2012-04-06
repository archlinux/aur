# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-rtt-omniorb
pkgver=1.10.4
pkgrel=1
pkgdesc="The RealTime Toolkit is a C++ framework for the implementation of control systems - OmniORB enabled"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
depends=('boost' 'omniorb')
makedepends=('cmake')
provides=('orocos-rtt')
conflicts=('orocos-rtt')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/rtt/v${pkgver}/orocos-rtt-${pkgver}-src.tar.bz2)
md5sums=('c82b577966ec79c7f6b9d9d70a187ef6')

build() {
	cd ${srcdir}/orocos-rtt-${pkgver}
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB .
	make
}

package() {
	cd ${srcdir}/orocos-rtt-${pkgver}
	
	make DESTDIR=${pkgdir} install
}

