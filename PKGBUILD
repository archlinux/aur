# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2018.06.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('cd7973996001cd2825e9dcdda98de4f5')
sha512sums=('0ca508f34b46ab7008c24a5a7e6cdd2d4220689e5da9c8e92e362b2b9da5d4768d31ef8890a2b1f5ed6510fac9dbde5d0693a4bb62524d6dc61e5f11504d353b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
