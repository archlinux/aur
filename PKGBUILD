# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Antoni Przybylik <antoni.przybylik@wp.pl>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=libosmo-dsp
pkgver=0.5.0
pkgrel=1
pkgdesc="Osmocom library with SDR DSP primitives"
arch=('x86_64')
url="https://osmocom.org/projects/libosmo-dsp"
license=('GPL-2.0-or-later')
conflicts=("${pkgname}-git")
provides=('libosmodsp.so=0-64')
depends=('fftw')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('33c1b072cb67ae03ca668f59396ee670baa8a2659f68815b5e519d6e13a9e9d2')
_dirname='libosmodsp-0.4.0.10-dce1' # XXX: https://osmocom.org/issues/6788

build() {
	cd "${srcdir}/${_dirname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_dirname}"
	make DESTDIR=$pkgdir install
}
