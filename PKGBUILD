# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
pkgname=autokey-py3
pkgver=0.93.4
pkgrel=1
pkgdesc="Python 3 port of AutoKey. New features have been implemented since the initial porting."
url="https://github.com/guoci/autokey-py3"
depends=('python' 'python-pip' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify' \
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib')
optdepends=('python-gobject: for GTK GUI'
            'gtksourceview3: for GTK GUI'
            'libnotify: for GTK GUI'
            'python-qscintilla: for QT GUI'
            'kdebindings-python: for QT GUI')
conflicts=('autokey' 'autokey-gtk' 'autokey-qt' 'autokey-data')
license=('GPL3')
arch=('any')
source=('https://pypi.python.org/packages/source/a/autokey-py3/autokey-py3-0.93.4.tar.gz')
md5sums=('742d11eab5bad53485ada0ea6d9102cf')

build() {
    cd $srcdir/autokey-py3-0.93.4
    python setup.py build
}

package() {
    cd $srcdir/autokey-py3-0.93.4
    python setup.py install --root="$pkgdir" --optimize=1 
}
