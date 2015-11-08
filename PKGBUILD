# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.14.0
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/libcxml"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
#http://carlh.net/downloads/libcxml/libcxml-0.12.0.tar.bz2
sha256sums=('1920c376ce7c498c3dc6fbbea57a84fe943208b65d3a6c0d2667067a5360af3f')


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
