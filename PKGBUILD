# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-abis
pkgver=1.5.1
pkgrel=1
pkgdesc="Osmocom library for A-bis interface"
arch=('any')
url="https://osmocom.org/projects/libosmo-abis"
license=(GPL)
depends=('libosmocore' 'ortp') # TODO: libosmocore>=1.9.0
provides=("libosmoabis.so=13-64"
          "libosmotrau.so=2-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('24497985ac315d7e12e02b0663f44ade2663c9ab312e8a77ec7f680a579be80e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-dahdi
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
