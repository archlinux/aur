# Maintainer: Szymon Morawski <szymorawski@gmail.com>
pkgname=mqtt-forward-git
pkgver=1
pkgrel=1
pkgdesc="Tool used to forward TCP traffic (typically SSH) over MQTT."
arch=('x86_64')
url="https://github.com/erstrom/mqtt-forward"
license=('MIT')
depends=('mosquitto' 'openssl')
makedepends=('git' 'gcc')
options=(!debug)
source=(git+https://github.com/erstrom/mqtt-forward.git)
md5sums=('SKIP')

build() {
  cd mqtt-forward
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr/local -DCMAKE_BUILD_TYPE=release ..
  make
}

package() {
  cd mqtt-forward/build
  make install
}