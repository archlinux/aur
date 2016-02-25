# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-applet-dock
_pkgname=dock-applet
pkgver=0.63
pkgrel=1
pkgdesc="Application dock for the MATE panel"
arch=('any')
url="https://github.com/robint99/dock-applet"
license=('GPL3')
depends=('mate-panel' 'python-cairo' 'python-gobject' 'python-xdg')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/robint99/$_pkgname/archive/V$pkgver.tar.gz")
md5sums=('20c70655ed935c33defb71247117ae2e')

prepare() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
