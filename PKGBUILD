# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2019.05.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2' 'wget')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('9c8f57e3d8e756fcc945655a2a3378b1')
sha512sums=('943e59dc06782717a76992632e5612402581b6dad3d1a4a7c7d37d877b86c1bf30afc00aca922567d1bf77836fe490bbe68d62aff943ab71577dbdf7a260c9e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
