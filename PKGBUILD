# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.12.0
pkgrel=2
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/libcxml"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
#http://carlh.net/downloads/libcxml/libcxml-0.12.0.tar.bz2
sha256sums=('f172454b208850fbf8ee72b8691a8b1155a1ffadcf9cad2fc4546e24849b58a0')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
