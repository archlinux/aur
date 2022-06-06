# Maintainer: Nikolai Hartmann <nikoladze@posteo.de>
pkgname=prmon
pkgver=3.0.2
pkgrel=1
pkgdesc="Standalone monitor for process resource consumption"
arch=('x86_64')
url="https://github.com/HSF/prmon"
license=('Apache')
makedepends=('cmake' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HSF/prmon/releases/download/v$pkgver/v$pkgver.tar.gz")
sha256sums=("31eaa08bb580318592d3b84bac820a0d475df46efb026e4997f25be27087a49a")

build() {
  mkdir build
  cd build
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
