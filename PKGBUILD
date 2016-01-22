# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.01.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4b1ea3ac1abfe01440f192a61b8b78e563b21fd76255952369696778e7441432')
sha512sums=('697defaabe6cd486b0983e9e761bb2e6e8a9e7d349556a6cd48b2ffef27f34b6530d4130de9bfeae45c140fcea9e51ecbf8e57ef1c2e5146d2c5c595d6dd42ea')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
