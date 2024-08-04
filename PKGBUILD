# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-netif
pkgver=1.5.1
pkgrel=1
pkgdesc="Osmocom library for muxed audio"
arch=('any')
url="https://osmocom.org/projects/libosmo-netif"
license=('GPL-2.0-or-later')
# TODO: libosmocore>=1.9.0 libosmo-abis>=1.5.0
depends=('lksctp-tools' 'libpcap' 'libosmocore' 'libosmo-abis')
provides=("libosmonetif.so=11-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d0ef27d2b8cba8b230e846430716c10e4d9e3e71e25699bd076e273310ed3147')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
