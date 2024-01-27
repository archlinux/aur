# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libsmpp34
pkgver=1.14.3
pkgrel=2
pkgdesc="Osmocom version of libsmpp34, an implementation of the SMPP Protocol v3.4"
arch=('any')
url="https://osmocom.org/projects/libsmpp34"
license=(GPL)
depends=('libxml2')
provides=("libsmpp34.so=1-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('12f1de3eb5655b993baa15ebc27cd25b6777ef6f4f3a6b1354299104308f58f0')

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
