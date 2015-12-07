# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.15.0
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/libcxml"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
#http://carlh.net/downloads/libcxml/libcxml-0.12.0.tar.bz2
sha256sums=('02f7afc8851b5fc12d2868a4f899dd343efbfc4e4fb7adf74f26450afd7a265f')


build() {
    CXXFLAGS="$CXXFLAGS -std=c++11"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
