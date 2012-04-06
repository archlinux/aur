# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.0.2
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('eigen' 'orocos-rtt' 'python' 'sip')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~rsmits/kdl/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('4f786fcf415d2db64681ad487c25f419')

build() {
	cd ${srcdir}/kdl-${pkgver}
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${srcdir}/kdl-${pkgver}
	
	make DESTDIR=${pkgdir} install
}

