# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.07.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0ee637fd13a275c59c4186ed7e9972fbbd319539fa61ee931c85e2a6a5506501')
sha512sums=('bc9f4a258621387830141d90bf3a91dd989ee95bd4e0b0c8d541e8ba2b3f87fea5416cc9b3df7a042fb173f158491dcc6da49ad0032f6599b7b047719c02ecf0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
