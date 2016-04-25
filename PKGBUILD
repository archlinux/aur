# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.3.3
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/libdcp"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg' 'libcxml>=0.15.0' 'libsigc++>=2.0' 'boost-libs>=1.45' 'libasdcp-cth>=0.1.0')
makedepends=('python2' 'boost>=1.45')
source=("http://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  )
sha512sums=('c33e48b4722280cb1c505152c5f32ca44941341e1e533f96076b842fa45aa01db43e6f5b117dbb2efb6b511c391358f849594a1231ac1751f5f7328055c6475c')

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

