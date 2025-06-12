# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
pkgver=2.6.2
pkgrel=1
pkgdesc="Tool for measuring and analyzing runtime behavior of parallel programs."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/start.html"
license=('custom')
depends=('openmpi')
makedepends=('cubelib>=4.9' 'cubew>=4.9' 'cubegui>=4.9' 'otf2>=3.1' 'scorep>=9.0' 'openmpi')
install=scalasca.install
source=("http://apps.fz-juelich.de/scalasca/releases/${pkgname}/${pkgver::-2}/dist/${pkgname}-${pkgver}.tar.gz")
md5sums=('8628cb026e1a9bd6399087c7eea93106')


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
