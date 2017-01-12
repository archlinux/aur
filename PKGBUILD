# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=autokey-py3
pkgver=0.93.9
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
sha256sums=('f8a1c85ada996884e5537a2586e8088048d41fad6d86d4160bd9cb9ca31816cd')
install=$pkgname.install

build() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
