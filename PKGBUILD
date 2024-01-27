# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-abis
pkgver=1.5.0
pkgrel=2
pkgdesc="Osmocom library for A-bis interface"
arch=('any')
url="https://osmocom.org/projects/libosmo-abis"
license=(GPL)
depends=('libosmocore' 'ortp') # TODO: libosmocore>=1.9.0
provides=("libosmoabis.so=13-64"
          "libosmotrau.so=2-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ddbee7b8cac95d05cb0601276609cf4bbea8f2bf2a229a250680ca759836f418')

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
