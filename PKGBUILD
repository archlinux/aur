# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=autokey-py3
pkgver=0.93.7
pkgrel=1
pkgdesc="Python 3 port of AutoKey, a desktop automation utility for Linux and X11 with new features."
url="https://github.com/guoci/autokey-py3"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify' \
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib' 'python-six'
  'python-gobject' 'gtksourceview3' 'libnotify' 'libappindicator-gtk3')
optdepends=('python-qscintilla: for QT GUI (deprecated)'
            'kdebindings-python: for QT GUI (deprecated)')
conflicts=('autokey' 'autokey-gtk' 'autokey-data')
license=('GPL3')
arch=('any')
source=("https://github.com/autokey-py3/autokey/archive/v${pkgver}.tar.gz")
sha256sums=('28a7efd4d4e82df0f41c33bffc56acecb9396e355392a9591f3950c27e8c1efe')
install=$pkgname.install

build() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
