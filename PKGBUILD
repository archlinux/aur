# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
pkgname=python-autokey-py3
pkgver=0.93.4
pkgrel=1
pkgdesc='Python 3 port of AutoKey, a desktop automation utility for Linux and X11.'
arch=(any)
url='https://github.com/guoci/autokey-py3'
license='GPL v3'
depends=('python' 'python-pip' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify' \
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd')
optdepends=('python-gobject: for GTK GUI'
            'gtksourceview3: for GTK GUI'
            'libnotify: for GTK GUI'
            'python-qscintilla: for QT GUI'
            'kdebindings-python: for QT GUI')

build() {
  pip install --no-deps --target="autokey-py3" autokey-py3
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.4/site-packages/
  cp -r $srcdir/autokey-py3/* $pkgdir/usr/lib/python3.4/site-packages/
}
