# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: lily wilson <hotaru@thinkindifferent.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.75
pkgrel=1
pkgdesc="Translates PostScript and PDF graphics into other vector formats, with EMF support"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL')
depends=('gcc-libs' 'plotutils' 'gd' 'imagemagick' 'libemf')
makedepends=('ghostscript')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('a1965d0fcc4e151a265907865078d2c4')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --with-emf
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}