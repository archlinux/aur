# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-gtk
pkgver=0.25.0
pkgrel=2
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
md5sums=('8ade6ca500e3776fc226700b207fa785')
install=tomate-gtk.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
