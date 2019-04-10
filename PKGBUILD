# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.4.4
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
            'python-matplotlib: basic LaTeX formula support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/MyNotes/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/j4321/MyNotes/releases/download/v${pkgver}/MyNotes-${pkgver}.tar.gz.asc")
sha512sums=('932a0072d4383eaf703ec9d688d3dd34b3c800d830d9a37c8dbeb1a8eb92bed0b2c96cdca1937c36c64342e4ff0563776c6677f301991f7dfcdb1b7257c4da11'
            'SKIP')
validpgpkeys=('F7E6D310FC0EA1C508EEF57F9D3922470AA9CD44') 

build() {
    cd "$srcdir/MyNotes-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/MyNotes-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
