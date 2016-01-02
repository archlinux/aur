# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht
pkgver=0.4.1
pkgrel=1
pkgdesc="Creates colorful moviebarcodes from video files, comes with a shared C library"
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'libpng' 'popt')
makedepends=('git' 'cmake' 'help2man')
source=(https://github.com/nordlicht/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('5e1a111ad7968081300c3ac2edc1560a')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
