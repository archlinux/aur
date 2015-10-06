# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.1.6
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2'  'libdcp>=1.2.6' 'libcxml>=0.13.0' 'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}.tar.bz2::http://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('61121c2f2ef78e11dae9e4fc45f65499dd4d29ef21064f1337eb40ad68f6e9ec8bbc50bc0ac0f42125739f77430ff334929c5c60edf735725d06c600f2bacd61')


build() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr 
  python2 waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}

         
