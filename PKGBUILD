# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.12.0
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libcxml/"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
#http://carlh.net/downloads/libcxml/libcxml-0.12.0.tar.bz2
sha256sums=('f08f948832873a0270efc6c02be5fbfc416e9ead2ccd1a66578931a54ec6363f')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
