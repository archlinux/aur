# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libuhd-umtrx
pkgver=1.0.19.r8.g4867d84
pkgrel=1
pkgdesc="Fairwaves UmTRX module for libuhd"
arch=('x86_64')
url="https://github.com/fairwaves/UHD-Fairwaves"
license=('GPL-3.0-or-later')
depends=('libuhd' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
_gitname=UHD-Fairwaves
_gitcommit=4867d84b1eced2b7ec2f7104d0f222d0daf86e11
source=("git+https://github.com/fairwaves/${_gitname}#commit=${_gitcommit}")
sha1sums=('SKIP')

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
