# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>
# Contributor: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scalasca
pkgver=2.6.1
pkgrel=1
pkgdesc="Tool for measuring and analyzing runtime behavior of parallel programs."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/start.html"
license=('custom')
depends=('openmpi')
makedepends=('cubelib' 'cubew' 'cubegui' 'otf2' 'scorep' 'openmpi')
install=scalasca.install
source=("http://apps.fz-juelich.de/scalasca/releases/${pkgname}/${pkgver::-2}/dist/${pkgname}-${pkgver}.tar.gz")
md5sums=('56a49be3c2fe1c021ceeb8780a73757d')


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
