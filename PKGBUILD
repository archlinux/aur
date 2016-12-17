# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.12.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a6136fe165e66e91fecc8877241aeffd93ecfad642dc46987c5fe47c5e9b7062')
sha512sums=('f1d5a36a3fdf6a7fd0ee91f272313f50de15b23fcb9502b830f5c70c747805873254f6698b0d186f01d2ab5567ceb70aa8f7dc4d42af1236ba8c0e6746994808')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
