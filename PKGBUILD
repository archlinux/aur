# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-netif
pkgver=1.4.0
pkgrel=2
pkgdesc="Osmocom library for muxed audio"
arch=('any')
url="https://osmocom.org/projects/libosmo-netif"
license=(GPL)
# TODO: libosmocore>=1.9.0 libosmo-abis>=1.5.0
depends=('lksctp-tools' 'libpcap' 'libosmocore' 'libosmo-abis')
provides=("libosmonetif.so=11-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1c4bae3949775364e4f85c61791a6d9ffafd69efb229b4f148d98dbd20907b42')

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
