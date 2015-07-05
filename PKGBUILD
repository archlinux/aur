# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=atlc
pkgver=4.6.1
pkgrel=3
pkgdesc="A CAD package used for analysing and desiging electrical transmission lines of arbitrary cross section. Also for the design of directonal couplers."
arch=('i686' 'x86_64')
url="http://atlc.sourceforge.net/"
depends=("sh")
#makedepends=('')
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2)

md5sums=('2e8e0f3cd85c07b19107799d262d3444')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure -prefix=/usr
	make
	
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install PREFIX=/usr DESTDIR=$pkgdir
}
