# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2017.04.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5223f7d4b2a9bf945b60d6a1fa1b1be6d2f82c5d04efefe34a09593c9dc3862b')
sha512sums=('ec8e48c62362813de839b522f26b0f16e0f8131a152300d0aa96d031daf6dcceb481491e0a24357e020d7fa6b397182dd7bb53df2c185690eac526eebf012a69')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
