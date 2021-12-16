# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=neosphere
pkgver=5.7.0
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('x86_64')
url="https://github.com/fatcerberus/neosphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
replaces=('minisphere')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('5a8284fdedd3a57edb9c9ab12a7d1483f317919992802ca49efa434c125e3f16')

build() {
  cd neosphere-$pkgver
  make
}

package() {
  cd "neosphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
