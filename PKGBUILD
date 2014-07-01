# Maintainer: Felix Yan <felixonmars@gmail.com>
# Author: CSSlayer <wengxt@gmail.com>
# Contributor: Yangtse <yangtsesu@gmail.com> 

pkgname=fcitx-ui-light
pkgver=0.1.3
pkgrel=3
pkgdesc="Light weight xlib and xft based ui for fcitx."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL2')
depends=('fcitx>=4.1.0' 'libxpm')
makedepends=('cmake' 'intltool')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")

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

md5sums=('633e8b018da9c8f09f99567b5479cf18')
