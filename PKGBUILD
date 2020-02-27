# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=4.3.1
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=('belr>=4.3' 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('bb1a1651fab5af5418c152f83d8f8781ae640dbe542d384ee349570281a3c029')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "../$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
