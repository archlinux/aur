# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=amqp-cpp
_pkgnm=AMQP-CPP
pkgver=4.1.4
pkgrel=1
pkgdesc="C++ library for asynchronous non-blocking communication with RabbitMQ"
arch=('any')
url="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v$pkgver.tar.gz)
sha256sums=('1e0d070d980e44a2293a94c416b5690ffc529e0246cc2ef079dec59773b9708b')


package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DAMQP-CPP_BUILD_SHARED=on -DAMQP-CPP_LINUX_TCP=on ../$_pkgnm-$pkgver    
  make
  make DESTDIR=$pkgdir install
}

