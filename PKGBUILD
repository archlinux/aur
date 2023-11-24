# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.4.0-alpha1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Desktop client application for Searx/SearXNG/searx-space"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5' 'python-jsonschema')
optdepends=('python-pysocks: socks proxy support')
makedepends=('gettext' 'qt5-tools')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('cee17ff483b5c344f1159b7ccd1c2068782becdceb03f47b05727c48fb847299')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
