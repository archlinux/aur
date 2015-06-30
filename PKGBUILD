# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sccp
pkgver=0.0.6.3
pkgrel=1
pkgdesc="Osmocom library for SCCP"
arch=('any')
url="http://openbsc.osmocom.org"
license=(GPL)
depends=('libosmocore')
makedepends=('git')
source=("git://git.osmocom.org/${pkgname}.git#tag=${pkgver}")
sha256sums=("SKIP")

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
