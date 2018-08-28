# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.2.1
pkgrel=3
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'python-pillow' 'python-pycryptodome' 'gettext' 'desktop-file-utils' 'libnotify')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/CheckMails/archive/v$pkgver.tar.gz")
sha512sums=('0ab34ba8db7581da848573b18769b15256cf20fc4a159a4871f6d3ae1d4af8b09bf1c555f7b748813ac2f147cf864bda1c20ebeb67739d79533ff773001c0757')
changelog=changelog

build() {
    cd "$srcdir/CheckMails-$pkgver"
    python setup.py build
}

package() {
	cd "$srcdir/CheckMails-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1  --skip-build
}
