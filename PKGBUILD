# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=geotagging
pkgver=0.7.6
pkgrel=1
pkgdesc='Photography geotagging tool to synchronize photos with gps track log (GPX)'
arch=('x86_64')
url='https://github.com/jmlich/geotagging'
license=('GPL3')
depends=('exiv2' 'qt6-webengine')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("https://github.com/jmlich/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c4339f74f5d5a4e01d3c91d71e7f58490fa7f8eadf0190695e384c7a4b958493')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
