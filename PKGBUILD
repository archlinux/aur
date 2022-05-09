# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainpanel
pkgver=0.1.2a
pkgrel=2
pkgdesc="plainDE panel"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem python3 plainabout)
makedepends=(git)
source=("git+https://github.com/plainDE/plainPanel.git#tag=v${pkgver}")
sha256sums=('SKIP')
optdepends=("plaincontrolcenter: Edit config from AUR")

build() {
  cd $srcdir/plainPanel
  qmake
  make
}

package() {
  mkdir -p $pkgdir/usr/share/plainDE/ $pkgdir/usr/bin
  mv $srcdir/plainPanel/plainPanel $pkgdir/usr/bin/
  cp $srcdir/plainPanel/tools/genconfig.py $pkgdir/usr/share/plainDE/
  cp $srcdir/plainPanel/readme-icon.png $pkgdir/usr/share/plainDE/menuIcon.png
}

