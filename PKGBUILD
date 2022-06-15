# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 01/04/2022

pkgname=qt6-qtmqtt
pkgver=6.3.1
pkgrel=1
pkgdesc="Qt Module to implement MQTT protocol."
arch=("x86_64")
url="https://github.com/qt/qtmqtt"
license=("MIT")
depends=(qt6-base)
makedepends=(git cmake)

source=("git+https://github.com/qt/qtmqtt.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -B build -S qtmqtt -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
