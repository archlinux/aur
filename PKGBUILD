# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.2.21
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('i686' 'x86_64')
url="http://github.com/nemomobile/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://git.merproject.org/mer-core/mlite.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd mlite

  qmake-qt5
  make
}

package() {
  cd mlite

  make INSTALL_ROOT="${pkgdir}" install

  # Remove tests
  rm -r "$pkgdir/opt"
}
