# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainabout
pkgver=0.1.2
pkgrel=2
pkgdesc="plainDE panel"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem)
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
  mv $srcdir/plainPanel/plainAbout $pkgdir/usr/share/plainDE/
  ln -s $pkgdir/usr/share/plainDE/plainAbout $pkgdir/usr/bin/plainAbout
}

