# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-netif
pkgver=1.6.1
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
sha256sums=('abe4991b1b21528643a9b470a42be8b6434baa6b5bea3c2bf8a31358cc700ef5')

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
