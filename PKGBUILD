# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2015.12.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9e551e7d6eb25f31dc137626b6c3fc29f4233a71911bd6b1c7ceea02fd291ea1')
sha512sums=('ccbe99252f04e3eb030516c3482e6c02cac499fd8b12476095bcb7dd5734b0ac15aeaefa4aecb35da5c941685b5e43a296da40463a5b2733bf064ef86f303024')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
