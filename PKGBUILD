# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-ocl
pkgver=1.10.2
pkgrel=1
pkgdesc="OROCOS Components for Control"
arch=('i686' 'x86_64')
url="http://www.orocos.org/ocl"
license=('GPL')
depends=('orocos-rtt' 'orocos-bfl' 'orocos-kdl')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/ocl/v${pkgver}/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('6965c4b010beedbe591eb80f0d003ae2')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
}

