# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-qt5
pkgver=0.1.1
pkgrel=5
pkgdesc="QT5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' 'qt5-base')
makedepends=('cmake')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
}
md5sums=('c93a4922ddc4f042749e707673f0fa41')
