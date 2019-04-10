# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.3.1
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
sha512sums=('fcf3e5561e914434ccce3b3a428335956d96ed72b5416dbef175a4391aeb1924cd2050e915ddf3279b429398fb0a6f7cccc136517569f789bfe73cbb5ec6870d')

build() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
