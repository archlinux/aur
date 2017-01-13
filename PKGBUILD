# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=nordlicht-git
_gitname=nordlicht
pkgver=20170113
pkgrel=1
pkgdesc="Creates colorful timebars from video and audio files, comes with a shared C library. Inspired by the moviebarcode tumblr."
arch=('i686' 'x86_64')
url="http://github.com/nordlicht/nordlicht"
license=('GPL')
depends=('ffmpeg' 'popt')
makedepends=('git' 'cmake' 'help2man')
provides=('nordlicht')
conflicts=('nordlicht')
source=('git+https://github.com/nordlicht/nordlicht')
sha1sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
