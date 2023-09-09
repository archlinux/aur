# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sccp
pkgver=1.7.0
pkgrel=1
pkgdesc="Osmocom library for SCCP"
arch=('any')
url="https://osmocom.org/projects/libosmo-sccp"
license=(GPL)
depends=('libosmocore' 'libosmo-netif')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('de7e5bc979e85f8f4fc30f37c31156cc55e8a43d7f64cf5ff9bb13cbf9746d75')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
