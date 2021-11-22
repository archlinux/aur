# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: lily wilson <hotaru@thinkindifferent.net>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.78
pkgrel=1
pkgdesc="Translates PostScript and PDF graphics into other vector formats, with EMF support"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL')
depends=('libzip' 'plotutils' 'gd' 'imagemagick' 'libemf')
makedepends=('texlive-core')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('8cc28e34bc7f88d913780f8074e813dd5aaa0ac2056a6b36d4bf004a0e90d801')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --with-emf
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}
