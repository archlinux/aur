# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Author: CSSlayer <wengxt@gmail.com>
# Contributor: Yangtse <yangtsesu@gmail.com>

pkgname=fcitx-ui-light
pkgver=0.1.3
pkgrel=3
pkgdesc="Light weight xlib and xft based ui for fcitx."
arch=('x86_64')
url="https://github.com/fcitx/fcitx-ui-light"
license=('GPL2')
depends=('fcitx' 'libxpm')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('633e8b018da9c8f09f99567b5479cf18')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
