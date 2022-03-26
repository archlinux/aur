# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>

pkgname=libuhd3-umtrx
pkgver=1.0.19
pkgrel=1
pkgdesc="Fairwaves UmTRX module for libuhd3"
arch=('x86_64')
url="https://github.com/fairwaves/UHD-Fairwaves"
license=('unknown')
depends=('libuhd3' 'boost-libs')
makedepends=('cmake' 'boost')
source=("git+https://github.com/fairwaves/UHD-Fairwaves#tag=${pkgver}")
sha1sums=('SKIP')
_gitname=UHD-Fairwaves

build() {
  cd "$_gitname/host"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$_gitname/host/build"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
