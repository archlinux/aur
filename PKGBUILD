# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.06.1
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b6371104d38ea6d995b93a250e7d84dc2a92798c9521d299d5d41006229f9d5f')
sha512sums=('2718469a1e2466a140d5af3c100b2b096f77f3bce72925d3801ae31ebdab238c4aa35e302aa7d1dd50972f5fdc82fc0e64facb5d1b0a85c0d3328d6ec6da1df0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
