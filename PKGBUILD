# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.1.8
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2'  'libdcp>=1.2.8' 'libcxml>=0.14.0' 'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('7cb4249b165161fefe078b6e48f22f5e4d606b0021f7a364c279e11ff147091ac25e8bfda49dd8cb6efa9fd51621868b59d10f92f079d821290d8258889324e2')


build() {
  CXXFLAGS="$CXXFLAGS -std=c++11"
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr 
  python2 waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}

         
