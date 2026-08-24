# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-netif
pkgver=1.8.0
pkgrel=1
pkgdesc="Osmocom library for muxed audio"
arch=('any')
url="https://osmocom.org/projects/libosmo-netif"
license=('GPL-2.0-or-later')
# TODO: libosmocore>=1.9.0 libosmo-abis>=1.5.0
depends=('lksctp-tools' 'libpcap' 'libosmocore')
provides=("libosmonetif.so=11-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0482ca5c7de71334b207a7295d1b3148855c27a680604ce96a13bd7f8558f242')

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
