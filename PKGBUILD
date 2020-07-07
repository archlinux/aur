# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Author: CSSlayer <wengxt@gmail.com>
# Contributor: Yangtse <yangtsesu@gmail.com>

pkgname=fcitx-ui-light
pkgver=0.1.3
pkgrel=5
pkgdesc="Light weight xlib and xft based ui for fcitx."
arch=('x86_64')
url="https://github.com/fcitx/fcitx-ui-light"
license=('GPL2')
depends=('fcitx' 'libxpm')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.bz2")
sha512sums=('b390141afa42a1204b26588c85e2164b735298d9b805f07e36997d50c77d6a3b7b713a724a22f0762176fe7f5d956e111e0e814b1fa8348b58d4b7e9a44e9ca6')

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
