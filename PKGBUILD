# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=tmfs
pkgver=r7
pkgrel=1
pkgdesc="Apple's Time Machine fuse read only file system"
arch=('i686' 'x86_64')
url="https://github.com/abique/tmfs"
license=('MIT')
depends=('fuse2')
makedepends=(cmake ninja)
source=(tmfs::git://github.com/abique/tmfs#tag=r7)
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  cmake -GNinja -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd "$srcdir/$pkgname"

  DESTDIR="$pkgdir/" ninja install
}

# vim:set ts=2 sw=2 et:
