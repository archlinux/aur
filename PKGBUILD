# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-abis
pkgver=0.3.1
pkgrel=1
pkgdesc="Osmocom library for A-bis interface"
arch=('any')
url="http://openbsc.osmocom.org/trac/wiki/libosmo-abis"
license=(GPL)
depends=('libosmocore' 'ortp')
makedepends=('git')
source=("git://git.osmocom.org/${pkgname}.git#tag=v${pkgver}")
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
