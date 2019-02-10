# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>

pkgname=autokey-py3
pkgver=0.95.6
pkgrel=1
pkgdesc="Python 3 port of AutoKey, a desktop automation utility for Linux and X11 with new features."
url="https://github.com/autokey/autokey"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify'
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib' 'python-six'
  'python-gobject' 'gtksourceview3' 'libnotify' 'libappindicator-gtk3'
  'gtk-update-icon-cache')
makedepends=('python-setuptools')
optdepends=('kdialog: for Qt interface'
            'python-pyqt5: for Qt interface'
            'python-qscintilla-qt5: for Qt interface'
            'qt-at-spi: to work with KDE/Qt applications'
            'python-atspi: for ATSPI in Gtk interface')
conflicts=('autokey' 'autokey-gtk' 'autokey-data')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/autokey-py3/autokey/archive/v${pkgver}.tar.gz")
sha256sums=('d02aa25107c652d6eb960be0e7722bcc07d997a41fbf06b29babc0389ce3ee0d')

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
