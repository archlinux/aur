# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=amqp-cpp
_pkgnm=AMQP-CPP
pkgver=4.3.27
pkgrel=1
pkgdesc="AMQP-CPP is a C++ library for communicating with a RabbitMQ message broker."
arch=('any')
url="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v$pkgver.tar.gz)
sha256sums=('af649ef8b14076325387e0a1d2d16dd8395ff3db75d79cc904eb6c179c1982fe')

package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DAMQP-CPP_BUILD_SHARED=on -DAMQP-CPP_LINUX_TCP=on -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ../$_pkgnm-$pkgver 
  make
  make DESTDIR=$pkgdir install
}

