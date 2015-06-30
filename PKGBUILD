# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=osmo-trx-git
_pkgname=osmo-trx
pkgver=3214
pkgrel=1
pkgdesc="OpenBTS transceiver retro-fit"
arch=('any')
url="http://openbsc.osmocom.org/trac/wiki/OsmoTRX"
license=(GPL)
depends=('libuhd')
optdepends=('gnuradio: legacy support for USRP1')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
