# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainabout
pkgver=0.1.2a
pkgrel=1
pkgdesc="plainDE about screen"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make)
makedepends=(git)
source=("git+https://github.com/plainDE/plainAbout.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd $srcdir/plainAbout
  qmake
  make
}

package() {
  mkdir -p $pkgdir/usr/share/plainDE/ $pkgdir/usr/bin
  mv $srcdir/plainAbout/plainAbout $pkgdir/usr/share/plainDE/
  ln -s $pkgdir/usr/share/plainDE/plainAbout $pkgdir/usr/bin/plainAbout
}

