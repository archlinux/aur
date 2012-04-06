# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-bfl
pkgver=0.7.0
pkgrel=1
pkgdesc="The Bayesian Filtering Library provides a framework for inference in Dynamic Bayesian Networks"
arch=('i686' 'x86_64')
url="http://www.orocos.org/bfl"
license=('GPL')
depends=('boost')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~tdelaet/bfl_tar/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('8dc24bfc17b4ab6e12d88cc6b53ce705')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -DMATRIX_LIB=boost -DRNG_LIB=boost .
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
}

