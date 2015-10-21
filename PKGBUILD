# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=tmfs
pkgver=r5
pkgrel=1
pkgdesc="Apple's Time Machine fuse read only file system"
arch=('i686' 'x86_64')
url="https://github.com/abique/tmfs"
license=('MIT')
depends=('boost' 'boost-libs' 'fuse')
makedepends=(cmake ninja)
source=(https://github.com/abique/tmfs/archive/r5.tar.gz)
md5sums=('9b16328e8aefedb4e7075a9e71e9288c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -GNinja -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir/" ninja install
}

# vim:set ts=2 sw=2 et:
