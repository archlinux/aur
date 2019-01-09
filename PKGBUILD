# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="simple Blue Light Filter for X written in Python"
pkgver=0.4
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('python')
optdepends=('xorg-xgamma: backend'
            'scg: backend')
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
