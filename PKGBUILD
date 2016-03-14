# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.1.11
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2'  'libdcp>=1.3.0' 'libcxml>=0.15.1' 'libsigc++>=2.0' 'boost-libs>=1.45' 'libasdcp-cth')
makedepends=('python2' 'boost>=1.45')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('40d4ae9c4f94bf3aa7836309ff5fa66d72111625a34c0c14745021ef56fc7358a46eb5bb01fc5804fa6fbdfc0e846fa4d49b807dbcfe9c6dbed87871b7bd1d9f')


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

         
