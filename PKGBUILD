# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=depixelize-bzr
pkgver=0.0.0
pkgrel=1
pkgdesc="The depixelize binary provided with libdepixelize"
arch=(i686 x86_64)
url="https://launchpad.net/libdepixelize"
license=('GPL' 'LGPL')
depends=('lib2geom' 'popt' 'boost-libs')
makedepends=('bzr' 'cmake' 'boost')
source=(bzr+lp:libdepixelize)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libdepixelize"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/libdepixelize"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/libdepixelize"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
