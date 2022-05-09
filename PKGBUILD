# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainpanel
pkgver=0.1.3
pkgrel=1
pkgdesc="plainDE panel"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem python3 plainabout)
makedepends=(git)
source=("git+https://github.com/plainDE/plainPanel.git#tag=${pkgver}")
sha256sums=('SKIP')
optdepends=("plaincontrolcenter: Edit config from AUR")

prepare () {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/plainDE/{tools,styles} 
}

build() {
  cd $srcdir/plainPanel
  qmake
  make
}

package() {
  cp $srcdir/plainPanel/plainPanel $pkgdir/usr/bin/
  cp $srcdir/plainPanel/tools/genconfig.py $pkgdir/usr/share/plainDE/tools/
  cp $srcdir/plainPanel/readme-icon.png $pkgdir/usr/share/plainDE/menuIcon.png
  cp $srcdir/plainPanel/styles/* $pkgdir/usr/share/plainDE/styles/
}

