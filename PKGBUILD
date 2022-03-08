# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.3-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
makedepends=('gettext' 'qt5-tools')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('33f526d594423ec3cc8bfef417bc6bf8ba270eb0ba22c81a218b63de43ef64c3')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
