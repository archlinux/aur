# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-dsp
pkgver=0.3
pkgrel=1
pkgdesc="A library with SDR DSP primitives"
arch=('any')
url="http://cgit.osmocom.org/libosmo-dsp/"
license=(GPL)
depends=('fftw')
makedepends=('git')
source=("git://git.osmocom.org/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
