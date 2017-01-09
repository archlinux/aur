# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht
pkgver=0.4.5
pkgrel=1
pkgdesc="Creates colorful timebars from video and audio files, comes with a shared C library. Inspired by the moviebarcode tumblr."
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'popt')
makedepends=('git' 'cmake' 'help2man')
source=(https://github.com/nordlicht/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('ba517dcb73241af3b273e44ec4de116a')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
