# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=fastcdr
_pkgnm=Fast-CDR
pkgver=1.0.11
pkgrel=1
pkgdesc="eProsima FastCDR is a C++ library that provides two serialization mechanisms. One is the standard CDR serialization mechanism, while the other is a faster implementation that modifies the standard."
arch=('any')
url="https://www.eprosima.com"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/eProsima/Fast-CDR/archive/v${pkgver}.tar.gz)
sha256sums=('9a83eb34014ee4a466d130bc04546bf53f8598f33261356387cbbf054515a8e8')


package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$_pkgnm-$pkgver    
  make
  make DESTDIR=$pkgdir install
}

