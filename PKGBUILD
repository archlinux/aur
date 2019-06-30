# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=amqp-cpp
_pkgnm=AMQP-CPP
pkgver=4.1.5
pkgrel=1
pkgdesc="C++ library for asynchronous non-blocking communication with RabbitMQ"
arch=('any')
url="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v$pkgver.tar.gz)
sha256sums=('9840c7fb17bb0c0b601d269e528b7f9cac5ec008dcf8d66bef22434423b468aa')


package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DAMQP-CPP_BUILD_SHARED=on -DAMQP-CPP_LINUX_TCP=on ../$_pkgnm-$pkgver    
  make
  make DESTDIR=$pkgdir install
}

