# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.02.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2109e0eac4122620194e7af1d0959356692fbd7367b0471ff8250377901d9178')
sha512sums=('6d6b30dfcba0382618d1a47ba57ced4c6cdcdfb6cef1454034fe6dbe6d6e50cbf94ae86439f76f7bbf4143e4ff8980ae67263eb93013387715b9dd816c9b4017')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
