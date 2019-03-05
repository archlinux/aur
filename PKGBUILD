# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.3.0
pkgrel=1
pkgdesc="RSS and Atom feed agregator in desktop widgets + notifications"
arch=('any')
url="https://github.com/j4321/FeedAgregator"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'gettext' 'desktop-file-utils' 'libnotify'
         'python-beautifulsoup4' 'python-babel' 'python-feedparser'
         'python-pillow' 'tkhtml3-git' 'python-dateutil' 'python-ewmh')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)',
            'zenity: nicer color chooser',
            'python-tkcolorpicker: nicer color chooser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/FeedAgregator/archive/v${pkgver}.tar.gz")
sha512sums=('c2c35fd9a5e84da4a6268d0123fd8a9b5882c7af679e8cba2b12fad71fc74222c6426d5d60afc9574ee21c76e955deaf527b80e109c245284fe8ddfa9a3bf5a0')

build() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
