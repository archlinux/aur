# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=neosphere
pkgver=5.7.1
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('x86_64')
url="https://github.com/fatcerberus/neosphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
replaces=('minisphere')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('fdb63c03201508d3b9eef65d0fe0ed3a20b3bfbee2eb04ddc27c5e70f9b8f77a')

build() {
  cd neosphere-$pkgver
  make
}

package() {
  cd "neosphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
