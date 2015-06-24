# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht
pkgver=0.3.5
pkgrel=2
pkgdesc="Creates colorful moviebarcodes from video files, comes with a shared C library"
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'libpng' 'popt')
makedepends=('git' 'cmake' 'help2man')
source=(https://github.com/nordlicht/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('0d9da375be20b0722f7ae15f3974c37a')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
