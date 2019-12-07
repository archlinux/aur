# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="simple and configurable Blue Light Filter for X"
pkgver=1.11.4
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('libx11' 'libxrandr' 'python')
optdepends=('xorg-xgamma: backend')
makedepends=('git')
source=('git+https://github.com/jumper149/blugon.git')
_gitname="blugon"
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  grep "VERSION =" "blugon.py" | cut --delimiter="'" --fields=2
}

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
  make clean
}
