# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sccp
pkgver=1.8.1
pkgrel=2
pkgdesc="Osmocom library for SCCP"
arch=('any')
url="https://osmocom.org/projects/libosmo-sccp"
license=(GPL)
# TODO: libosmocore>=1.9.0 libosmo-netif>=1.4.0
depends=('libosmocore' 'libosmo-netif')
provides=("libosmo-sigtran.so=9-64")
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-stp.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a9f90232e36c3d91069fd6f999c6b809f803fdf3d047c525bd5e6f30d1f98d11')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
