# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2015.05.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c26d28057a71f06cb102fa6058b62efe7625a27997fdc0b6ee47adf151804f28')
sha512sums=('c3d3109be4a85b63c2809286d6174ec1f8dcc9ac7cebf5aa276d9589339e06fcb2f1838e1e0ed526d8da2e0e01b0056a1542cd889f5d66c9cba571d25891fdee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
