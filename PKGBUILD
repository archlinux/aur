# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainabout
pkgver=0.1.3
pkgrel=1
pkgdesc="plainDE about screen"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make)
makedepends=(git)
source=("git+https://github.com/plainDE/plainAbout.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  mkdir -p $pkgdir/usr/bin
}

build() {
  cd $srcdir/plainAbout
  qmake
  make
}

package() {
  cp $srcdir/plainAbout/plainAbout $pkgdir/usr/bin/
}

