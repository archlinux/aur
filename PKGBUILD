# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libosmo-pfcp
pkgver=0.3.0
pkgrel=2
pkgdesc="PFCP protocol encoding and decoding, and generic PFCP endpoint implementation"
arch=('any')
url="https://osmocom.org/projects/libosmo-pfcp"
license=(GPL)
depends=('libosmocore') # TODO: >=1.9.0
provides=("libosmo-gtlv.so=1-64"
          "libosmo-pfcp.so=0-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('37daaec7dae85cb7548263cab0227718d4d92aca18c3e0487f526dd0c6c49a54')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
