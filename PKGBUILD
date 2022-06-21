# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainpanel
pkgver=0.2
pkgrel=1
pkgdesc="plainDE panel"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem python3 xcompmgr plainbase plainartwork plainabout plaincontrolcenter)
makedepends=(git)
source=("git+https://github.com/plainDE/plainPanel.git#tag=${pkgver}")
sha256sums=('SKIP')
conflicts=('plainpanel-git')

build() {
  cd $srcdir/plainPanel
  qmake
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/plainPanel/plainPanel $pkgdir/usr/bin/plainPanel
}
