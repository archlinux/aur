# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="simple and configurable Blue Light Filter for X"
pkgver=1.12.1
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('libx11' 'libxrandr' 'python')
optdepends=('xorg-xgamma: backend')
source=("https://github.com/jumper149/blugon/archive/${pkgver}.tar.gz")
sha256sums=('e92a8c0d3152f4749228b10d52eccfa9ec4414b50a39995153b8f48e486df11e')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  make clean
}
