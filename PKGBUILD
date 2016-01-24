# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht
pkgver=0.4.4
pkgrel=1
pkgdesc="Creates colorful moviebarcodes from video files, comes with a shared C library"
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'popt')
makedepends=('git' 'cmake' 'help2man')
source=(https://github.com/nordlicht/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('819b58764d22d1cd54e4f11bd4c002f9')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
