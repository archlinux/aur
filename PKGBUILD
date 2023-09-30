# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=geotagging
pkgver=0.7.1
pkgrel=1
pkgdesc='Photography geotagging tool to synchronize photos with gps track log (GPX)'
arch=('x86_64')
url='https://github.com/jmlich/geotagging'
license=('GPL3')
depends=('exiv2' 'qt6-webengine')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("https://github.com/jmlich/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1f2b6e312d0f7d070b7b292aa65ae955e2cf3600b36e1e54b7446ab09ba30af3')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
