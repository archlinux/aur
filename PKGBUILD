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
depends=('libzip' 'plotutils' 'gd' 'imagemagick' 'libemf')
makedepends=('ghostscript')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('b7b5d8510b40a5b148f7751268712fcfd0c1ed2bb46f359f655b6fcdc53364cf')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --with-emf
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}