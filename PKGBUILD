# Maintainer: Tom Ingleby <tom@ewsting.org>
pkgname='mraa'
pkgver=0.7.2
pkgrel=0
pkgdesc="Low Level Skeleton Library for IO Communication on GNU/Linux platforms."
makedepends=('git' 'cmake' 'swig')
optdepends=('python: for Python support')
url="https://github.com/intel-iot-devkit/mraa"
license=('MIT')
arch=('x86_64' 'i686')

source=("https://github.com/intel-iot-devkit/mraa/archive/v0.7.2.tar.gz")
md5sums=('ad04bdfe35cede82256155261ccd400b')

build() {
  mkdir -p mraa-$pkgver/build
  cd mraa-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDSWIGNODE=off ../
  make
}

package() {
  cd $srcdir/mraa-$pkgver/build
  make DESTDIR="${pkgdir}/" install
}

