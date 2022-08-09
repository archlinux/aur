# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-gtk
pkgver=0.18.1
pkgrel=1
pkgdesc="A timer for the Pomodoro Technique"
arch=("any")
url="https://github.com/eliostvs/tomate-gtk"
license=("GPL")
depends=("desktop-file-utils"
         "gnome-icon-theme"
         "gtk-update-icon-cache"
         "gtk3"
         "hicolor-icon-theme"
         "python"
         "python-blinker"
         "python-dbus"
         "python-gobject"
         "python-pyxdg"
         "python-venusian"
         "python-wiring"
         "python-wrapt"
         "python-yapsy")
optdependes=("tomate-alarm-plugin: Plays alarm at session end"
             "tomate-indicator-plugin: Shows session progress in tray area"
             "tomate-notify-plugin: Plugin that shows screen notifications"
             "tomate-exec-plugin: Run commands when timer starts, stops or finishes"
             "tomate-statusicon-plugin: Plugin that shows the session progress in the notification area")
makedepends=("python-setuptools")
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('aa9a6c23731a44ce52354118377d4b31')
install=tomate-gtk.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
