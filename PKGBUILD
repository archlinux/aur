# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-gtk
pkgver=0.25.2
pkgrel=1
pkgdesc="A Pomodoro timer"
arch=("any")
url="https://github.com/eliostvs/tomate-gtk"
license=("GPL")
depends=("desktop-file-utils"
         "gnome-icon-theme"
         "gtk-update-icon-cache"
         "gtk3"
         "hicolor-icon-theme"
         "hicolor-icon-theme"
         "libnotify"
         "playerctl"
         "python"
         "python-blinker"
         "python-dbus"
         "python-gobject"
         "python-pyxdg"
         "python-venusian"
         "python-wiring"
         "python-wrapt"
         "python-yapsy"
         "gst-plugins-base"
         "gst-plugins-good"
         "gstreamer")
optdependes=("tomate-indicator-plugin: Displays the progress of the session in system tray"
             "tomate-statusnotifieritem-plugin: Displays the progress of the session in system tray"
             "tomate-statusicon-plugin: Displays the progress of the session in system tray")
makedepends=("python-setuptools")
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('4987f10cfe392be1772bc49a90b04065')
conflicts=("tomate-breakscreen-plugin" 
           "tomate-alarm-plugin" 
           "tomate-exec-plugin" 
           "tomate-notify-plugin")
install=tomate-gtk.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
