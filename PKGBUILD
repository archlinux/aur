# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: lily wilson <hotaru@thinkindifferent.net>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.76
pkgrel=1
pkgdesc="Translates PostScript and PDF graphics into other vector formats, with EMF support"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL')
depends=('libzip' 'plotutils' 'gd' 'imagemagick' 'libemf')
makedepends=('ghostscript')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('8cfd97eae18f138ef255b88b3d8a405734d20ea1b6acaa7706980b8fd8e4ce41')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --with-emf --disable-docs
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}
