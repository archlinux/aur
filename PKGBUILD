# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.1.12
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2'  'libdcp>=1.3.3' 'libcxml>=0.15.1' 'libsigc++>=2.0' 'boost-libs>=1.45' 'libasdcp-cth')
makedepends=('python2' 'boost>=1.45')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('15af42b7560833d1a63b44be75540d56c712a78aeb5ed79045d2ec0e34da60a309316fa628437f841e788f75affdbbdbbff5548194df7ab424d4e8d7f9756cb4')


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

         
