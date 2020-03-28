# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2020.03.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2' 'wget')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('8905d698bf5f54862c7eddf76e67e9ce')
sha512sums=('535fc8262a5cc1f9f2ec49e5f76d98376f0aa72acb966b11e23cb1a2cc96d0b695380a2e8438bc28fca6634edb062e06c27f54a79415506620174e9c45ff14de')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
