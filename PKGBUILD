# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=restbed-latest
pkgver=4.5.RC1
pkgrel=2
pkgdesc="A framework for asynchronous RESTful functionality in C++11 applications"
arch=('i686' 'x86_64')
url="https://github.com/Corvusoft/restbed"
license=('AGPL3')
depends=('openssl')
conflicts=('restbed')
provides=('restbed')
makedepends=('git' 'cmake' 'kashmir' 'asio-latest')
source=("restbed-4.5-RC1.tar.gz::https://github.com/Corvusoft/restbed/archive/4.5-RC1.tar.gz")
md5sums=('903bf8bb54ed2c91a1978fb200ca8c32')

build() {
  cd "$srcdir/restbed-4.5-RC1"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED=on
  make
}

package() {
  cd "$srcdir/restbed-4.5-RC1/build"

  make DESTDIR="$pkgdir" install
}
