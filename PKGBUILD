# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainabout
pkgver=0.2
pkgrel=1
pkgdesc="plainDE about screen"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make plainbase)
makedepends=(git)
source=("git+https://github.com/plainDE/plainAbout.git#tag=${pkgver}")
sha256sums=('SKIP')
conflicts=('plainabout-git')


build() {
  cd $srcdir/plainAbout
  qmake
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/plainAbout/plainAbout $pkgdir/usr/bin/plainAbout
}
