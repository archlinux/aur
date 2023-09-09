# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-netif
pkgver=1.3.0
pkgrel=1
pkgdesc="Osmocom library for muxed audio"
arch=('any')
url="https://osmocom.org/projects/libosmo-netif"
license=(GPL)
depends=('lksctp-tools' 'libpcap' 'libosmocore' 'libosmo-abis')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1987a28d523ae6b462b85a3abe00604fb690232d34e14a78f5ad4a7ba12c321d')

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
