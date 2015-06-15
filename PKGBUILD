# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libplatform
pkgver=1.0.9
pkgrel=1
pkgdesc="Platform support library used by libCEC and binary add-ons for Kodi"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/platform"
license=('GPL')
provides=('libplatform')
conflicts=('libplatform')
source=(https://github.com/Pulse-Eight/platform/archive/${pkgver}.tar.gz)
md5sums=('c6273248bf3e5736bb84748881415788')

build() {
  cd "$srcdir"/platform-${pkgver}
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
  make
}

package() {
  cd "$srcdir"/platform-${pkgver}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
