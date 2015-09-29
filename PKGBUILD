# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2015.09.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d7f645b970607dbcd6f3314d0e50e2b46fd8a24fc77c5e9c1dd27e7b54096d0f')
sha512sums=('18e6bb4cbcb0452287618c0ab0d09cae1f357fd2fc18f7b7a8c56d7724d268a999588cc4d5382fd5262be70bdfc8ab88945c0f1936a24469ca62bb5d4c05199b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
