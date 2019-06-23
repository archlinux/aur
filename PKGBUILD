# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=fastrtps-git
_pkgnm=Fast-RTPS
pkgver=1.8.0
pkgrel=1
pkgdesc="eprosima Fast RTPS is a C++ implementation of the RTPS (Real Time Publish Subscribe) protocol" 
arch=('any')
url="https://www.eprosima.com"
license=('Apache2.0')
depends=()
conflicts=(fastrtps)
makedepends=(cmake jdk8-openjdk gradle)
source=(git+https://github.com/eProsima/Fast-RTPS)
sha256sums=('SKIP')


package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  export GRADLE_USER_HOME=/tmp
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DTHIRDPARTY=ON -DBUILD_JAVA=ON  -DCOMPILE_EXAMPLES=OFF -DPERFORMANCE_TESTS=ON -DSECURITY=ON ../$_pkgnm 
  make
  make DESTDIR=$pkgdir install
}

