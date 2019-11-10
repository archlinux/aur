# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2019.11.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2' 'wget')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('b408412b947cd1c45b4fd21440c4d801')
sha512sums=('1241d00596470e65f352730066a529386cf5423ad20315d1ed76d848ec76c4641f2e42f9d97c73595ed83f28e858cb87e6c18dc155bc142a53cc861c4f9a9949')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
