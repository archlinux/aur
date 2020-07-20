# Maintainer: Pieter Goetschalckx

pkgname=antiprism
pkgver=0.26
pkgrel=1
pkgdesc="Create, transform, analyse, and visualise polyhedra."
arch=(x86_64)
url=https://www.antiprism.com/
license=(custom)
depends=('freeglut')
source=(https://www.antiprism.com/files/antiprism-${pkgver}.tar.gz)
sha256sums=('254f14cae5ffd1ab6266a414d6fad5ce4172b3c8927a4e37276559582b624cb9')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
	install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
