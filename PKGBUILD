# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-googlepinyin
pkgver=0.1.6
pkgrel=5
pkgdesc="Fcitx Wrapper for googlepinyin"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'libgooglepinyin')
makedepends=('cmake' 'intltool')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")
md5sums=('7ee33bbb66d29536819b0d2f73b69713')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  rm -rf build
  mkdir build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
