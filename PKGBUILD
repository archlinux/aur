# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=openbsc
pkgver=0.14.0
pkgrel=1
pkgdesc="Free software implementations for the GSM/G3PP protocol stacks"
arch=('any')
url="http://openbsc.osmocom.org"
license=(GPL)
depends=('libdbi' 'libdbi-drivers' 'ortp' 'libosmocore' 'libosmo-abis' 'libosmo-netif')
optdepends=('libosmo-sccp: for building BSC NAT')
source=("git://git.osmocom.org/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/${pkgname}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
