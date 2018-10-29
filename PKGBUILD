# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.2.0
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
sha512sums=('f162fc187fb2bcb32d0adb6fa75a028d377c31306947d9301cb701f00651b0fddef0f4abdb616a61c951f54af15cc6171225f3cdf3136bb0fd6446a270ace73c')

build() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/FeedAgregator-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
