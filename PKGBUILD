# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="simple and configurable Blue Light Filter for X"
pkgver=1.12.0
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('libx11' 'libxrandr' 'python')
optdepends=('xorg-xgamma: backend')
source=("https://github.com/jumper149/blugon/archive/${pkgver}.tar.gz")
sha256sums=('b22a0d432d68a38131b6dd673c6a6358ae43ea7a2757432afafc5285a5865acf')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  make clean
}
