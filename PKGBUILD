# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.4.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://github.com/j4321/MyNotes"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tk' 'python-ewmh' 'python-pillow' 'gettext' 'desktop-file-utils')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser',
            'texlive-bin: basic LaTeX formula support',
            'python-matplotlib: basic LaTeX formula support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/MyNotes/archive/v${pkgver}.tar.gz")
sha512sums=('93082ca5675e6768d2992fb907e67732baef8053b9dc7e6903b5115cdfd772afccd4b363841c5104c7599b6e868e32f002522fff11d6188dac8acfedbb615dc6')

build() {
    cd "$srcdir/MyNotes-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/MyNotes-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
