# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
pkgver=2.6
pkgrel=1
pkgdesc="Tool for measuring and analyzing runtime behavior of parallel programs."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/start.html"
license=('custom')
depends=('openmpi')
makedepends=('cubelib' 'cubew' 'cubegui' 'otf2' 'scorep' 'openmpi')
install=scalasca.install
source=(http://apps.fz-juelich.de/scalasca/releases/$pkgname/$pkgver/dist/$pkgname-$pkgver.tar.gz)
sha256sums=('b3f9cb1d58f3e25090a39da777bae8ca2769fd10cbd6dfb9a4887d873ee2441e')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-mpi=openmpi
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir install
}
