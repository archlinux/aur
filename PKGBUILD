# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.11.0
pkgrel=5
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libcxml/"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1c5c8bdbc77a19c02b0f783fa774ce33414ebd1c13f7dc276ae63dc010e639c6')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
