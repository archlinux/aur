# Maintainer: Tim Diels <timdiels.m@gmail.com>
# Contributor: Fetid Frog <fetidfrog at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=batti
pkgver=0.3.8
pkgrel=6
pkgdesc='Simple battery monitor for the system tray'
arch=('any')
url='https://addons.videolan.org/p/1130246/'
license=('GPL')
depends=('dbus-python' 'pygtk' 'gtk2' 'upower' 'hicolor-icon-theme')
optdepends=('notification-daemon: for power status notifications' 'xfce4-notifyd: alternative to notification-daemon')
install="$pkgname.install"
source=('https://addons.videolan.org/p/1130246/startdownload?file_id=1466638484&file_name=132291-batti-0.3.8.tar.gz&file_type=application/x-gzip&file_size=59783&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1466638484%2Fs%2F6aba40d425232e2272b3cb31625c2376%2Ft%2F1523185118%2Fu%2F166103%2F132291-batti-0.3.8.tar.gz'
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
