# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname=audiality2
pkgname=$_pkgname-git
pkgver=1.9.4
pkgrel=1
pkgdesc='Realtime audio and music engine'
arch=(x86_64)
url='http://audiality.org/'
license=(zlib)

makedepends=(
  'base-devel'
  'cmake'
)
depends=(
  'sdl'
  'jack'
)

conflicts=(
    "$_pkgname"
)
provides=(
    "$_pkgname"
)

source=("git+https://github.com/olofson/audiality2#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  rm -rf build; mkdir build; cd build
  cmake "$srcdir/$_pkgname"
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
}
