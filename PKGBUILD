# Maintainer: Tom Ingleby <tom@ewsting.org>
pkgname='mraa'
pkgver=0.7.2
pkgrel=1
pkgdesc="Low Level Skeleton Library for IO Communication on GNU/Linux platforms."
makedepends=('git' 'cmake' 'swig')
optdepends=('python: for Python support')
url="https://github.com/intel-iot-devkit/mraa"
license=('MIT')
arch=('x86_64' 'i686')

source=(git+https://github.com/intel-iot-devkit/mraa.git#tag=v$pkgver)
md5sums=('SKIP')

build() {
  mkdir -p mraa/build
  cd mraa/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDSWIGNODE=off ../
  make
}

package() {
  cd $srcdir/mraa/build
  make DESTDIR="${pkgdir}/" install
}
