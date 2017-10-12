# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libsedml
_pkgname=libSEDML
pkgver=0.4.3
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url="http://libsedml.sourceforge.net/libSedML"
license=('BSD 2-clause')
arch=('i686' 'x86_64')
depends=('libnuml')
source=("https://github.com/fbergmann/libSEDML/archive/v$pkgver.tar.gz")
md5sums=('2722b74dc83ff029b0432f4209e178f3')

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver/build
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P cmake_install.cmake
}
