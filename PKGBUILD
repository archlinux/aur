# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=neosphere
pkgver=5.7.2
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('x86_64')
url="https://github.com/fatcerberus/neosphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
replaces=('minisphere')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('fdce972db17d5bce2f1bc7201b38d5151389292ac8ab490897312c4a2dbc7300')

build() {
  cd neosphere-$pkgver
  make
}

package() {
  cd "neosphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
