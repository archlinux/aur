# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plaincontrolcenter
pkgver=0.1.3
pkgrel=2
pkgdesc="plainDE control center"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make plainpanel plainabout)
makedepends=(git)
source=("git+https://github.com/plainDE/plainControlCenter.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd $srcdir/plainControlCenter
  qmake
  make
}

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/plainDE
  cp $srcdir/plainControlCenter/plainControlCenter $pkgdir/usr/bin/
}

