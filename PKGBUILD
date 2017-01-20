# Maintainer: archlinux.info:tdy

pkgname=liblaxjson
pkgver=1.0.5
pkgrel=1
pkgdesc="C library for parsing JSON config files"
arch=(i686 x86_64)
url=https://github.com/andrewrk/liblaxjson
license=(MIT)
makedepends=(cmake)
source=(https://github.com/andrewrk/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(ffc495b5837e703b13af3f5a5790365dc3a6794f12f0fa93fb8593b162b0b762)

build() {
  mkdir $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
