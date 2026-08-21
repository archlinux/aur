# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-asn1-tcap
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility library for ASN.1 of TCAP (SS7)"
arch=('x86_64' 'i686')
url="https://gitea.osmocom.org/ss7-in-c/libosmo-asn1-tcap"
license=('GPL-2.0-or-later')
depends=('talloc')
conflicts=("${pkgname}-git")
provides=('libosmo-asn1-tcap.so=1-64')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('475f9fe1411eca2c64551166ee646b49955e61ec6c5afe3b87651da4efba2ad1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --libdir=/usr/lib/
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
