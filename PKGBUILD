# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=5.6.0
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/sphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6be076c02bd04e02872cee5275d56fd9539234bb11101b2144da32d375543a94')

build() {
  cd sphere-$pkgver
  make
}

package() {
  cd "sphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
