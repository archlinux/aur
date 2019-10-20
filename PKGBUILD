# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=liblocked-sstream
pkgver=0.0.5
pkgrel=1
pkgdesc="library for dcpomatic sstream locking"
arch=('i686' 'x86_64')
url="https://carlh.net/locked_sstream"
license=('GPL')
depends=('boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('liblocked-sstream')
conflicts=('liblocked-sstream-git')
source=("https://carlh.net/downloads/locked_sstream/locked_sstream-${pkgver}.tar.bz2")
sha512sums=('5d136c2e1ac5b1eabd07a8048715f47881662ce7a3bfdc2460428f34ab51b0474327b2f28ce6ba2f4ac9774478abb20082af8f954ebb1c4653ba24ca82991c32')

build() {
    CXXFLAGS="$CXXFLAGS    -std=c++11"
    cd ${srcdir}/locked_sstream-${pkgver}
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
  cd ${srcdir}/locked_sstream-${pkgver}
  python2 waf install --destdir=$pkgdir
}
