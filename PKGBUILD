# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.1.3
pkgrel=2
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
sha512sums=('88eccaf919547248b0774213f1bf18850abc8dc81153c45b87dd62e2294c3993b1bd4026d61083836d9cf28ac9d9e20cbb3208d3fd26047c77a7f43710d09e4e')

build() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
