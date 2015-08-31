# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Fetid Frog <fetidfrog at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=batti
pkgver=0.3.8
pkgrel=5
pkgdesc='Simple battery monitor for the system tray'
arch=('any')
url='http://code.google.com/p/batti-gtk/'
license=('GPL')
depends=('dbus-python' 'pygtk' 'gtk2' 'upower' 'hicolor-icon-theme')
optdepends=('notification-daemon: for power status notifications' 'xfce4-notifyd: alternative to notification-daemon')
install="$pkgname.install"
source=("http://batti-gtk.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        'upower-0.99.patch')
md5sums=('4b239ead1643c95a6d89c380bc167781'
         '237c98190cfd5725c9f5483c770a7763')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/upower-0.99.patch"
}

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
