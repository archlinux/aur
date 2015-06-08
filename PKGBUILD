# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=declarative-plasmoids
pkgver=4.10.5
pkgrel=1
pkgdesc="A set of plasmoids (QML) for Plasma Active"
arch=('any')
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
install=${pkgname}.install
source=("http://download.kde.org/stable/active/4.0/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b5cbb735b5537c210258ad6f68883c848b7c95bcb4b90eb479284697847cfb8d')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}
