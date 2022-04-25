# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libnuml
_pkgname=NuML
pkgver=1.1.6
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libsbml')
source=($_pkgname-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('1b51cd51bfe7e9c4e0bcd69f86d8199a23ebe9ea931d4f112b3f6e1666e4f2c8')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    $pkgname
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}
