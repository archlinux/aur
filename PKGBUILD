# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="a blue light filter written in python"
pkgver=1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('python')
optdepends=('xorg-xgamma: backend')
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
}
