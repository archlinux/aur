# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.3.1
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/libdcp"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg' 'libcxml>=0.15.0' 'libsigc++>=2.0' 'boost-libs>=1.45' 'libasdcp-cth>=0.1.0')
makedepends=('python2' 'boost>=1.45')
source=("http://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  )
sha512sums=('0a54a82f84fb132287084d8c10c96d06f986c91f92d8461d18a4c20d579ccec2058b346ea3f26b6eaad64bbacb2033f745a6c8199ec1baa9ac918333136d1ba4')

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

