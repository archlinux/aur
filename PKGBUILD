# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libsmpp34
pkgver=1.14.6
pkgrel=1
pkgdesc="Osmocom version of libsmpp34, an implementation of the SMPP Protocol v3.4"
arch=('any')
url="https://osmocom.org/projects/libsmpp34"
license=('LGPL-2.1-or-later')
depends=('libxml2')
provides=("libsmpp34.so=1-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7f7d6f2d8f0bc121bab458880b321e0fe2f57f01156dd855d09394ac06dfd130')

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
