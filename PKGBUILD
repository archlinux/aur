# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: lily wilson <hotaru@thinkindifferent.net>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.77
pkgrel=1
pkgdesc="Translates PostScript and PDF graphics into other vector formats, with EMF support"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL')
depends=('libzip' 'plotutils' 'gd' 'imagemagick' 'libemf')
#makedepends=('ghostscript')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('9a6c6b02ea91e9f836448ccc5a614caa514a9ba17e94f1d6c0babc72a4395b09')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --with-emf
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}
