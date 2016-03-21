# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-applet-dock
_pkgname=dock-applet
pkgver=0.70
pkgrel=1
pkgdesc="Application dock for the MATE panel"
arch=('any')
url="https://github.com/robint99/dock-applet"
license=('GPL3')
depends=('mate-panel' 'python-cairo' 'python-gobject' 'python-pillow' 'python-scipy' 'python-xdg')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/robint99/$_pkgname/archive/V$pkgver.tar.gz")
sha256sums=('c2d40f312c467867594e9f32badcae57d0ded204c0d0a0ff9d7c6f0d8e89aba3')

prepare() {
  cd $_pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
