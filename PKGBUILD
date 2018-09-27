# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.2.2
pkgrel=1
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
sha512sums=('fb08312c9dee338343762121cb00554b326c204893f1919a5ad0f2af80014951ea154c534950ca40613d2acbd75f19605a87d5c072bf34cfd630f8b24f50e120')
changelog=changelog

build() {
    cd "$srcdir/CheckMails-$pkgver"
    python setup.py build
}

package() {
	cd "$srcdir/CheckMails-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1  --skip-build
}
