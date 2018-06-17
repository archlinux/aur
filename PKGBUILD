# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
pkgver=2.4
pkgrel=1
pkgdesc="Tool for measuring and analyzing runtime behavior of parallel programs."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/start.html"
license=('custom')
depends=('openmpi')
makedepends=('cubelib' 'cubew' 'cubegui' 'otf2' 'scorep' 'openmpi')
install=scalasca.install
source=(http://apps.fz-juelich.de/scalasca/releases/$pkgname/$pkgver/dist/$pkgname-$pkgver.tar.gz)
sha1sums=('9157d1f4cc6a82d0cdc86da64ce818a7d1e59824')


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
