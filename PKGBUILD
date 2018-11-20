# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=meteoio
pkgver=2.7.0
pkgrel=1
pkgdesc="Make data access easy and safe for numerical simulations in environmental sciences"
arch=('x86_64')
url="https://models.slf.ch/p/meteoio/"
license=('LGPL3')
makedepends=('cmake')
optdepends=('doxygen: documentation')
source=("https://models.slf.ch/p/meteoio/downloads/get/MeteoIO-$pkgver-src.tar.gz")

build() {
  cd "MeteoIO-$pkgver-src"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "MeteoIO-$pkgver-src/build"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('4e5e141c7d56f18b79644116337775c03648e3e011bc1f30bee657afc63fe3ba')
