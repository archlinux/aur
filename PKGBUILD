# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht
pkgver=0.4.2
pkgrel=1
pkgdesc="Creates colorful moviebarcodes from video files, comes with a shared C library"
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'popt')
makedepends=('git' 'cmake' 'help2man')
source=(https://github.com/nordlicht/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('818adda932f7085c2ca56be9ff118442')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
