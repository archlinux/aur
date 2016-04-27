# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-hangul
pkgver=0.3.0
pkgrel=2
pkgdesc="Hangul (Korean) support for fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-hangul"
license=('GPL2')
depends=('fcitx' 'libhangul')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('07085508da98c49bcecf75fbfad6681263a735a1efcc4fb7a6fa05cb215dfe0c338e95e26cc55e488501b5abbc1007464b1bbf488f07aaca2d1a0a18c8173074')

prepare() {
  mkdir build
}

build() {
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$pkgname-$pkgver
  make
}

package() {
   cd build
   make DESTDIR="$pkgdir" install
}

