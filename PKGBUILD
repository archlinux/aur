# Maintainer: Pieter Goetschalckx

pkgname=antiprism
pkgver=0.30
pkgrel=1
pkgdesc="Create, transform, analyse, and visualise polyhedra."
arch=(x86_64)
url=https://www.antiprism.com/
license=(custom)
depends=('freeglut')
source=(https://www.antiprism.com/files/antiprism-${pkgver}.tar.gz)
sha256sums=('4ec7d029d4475ce5f78e2ab3a186d48346affd1cc12d589682801da5764b11be')

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
