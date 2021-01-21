# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.2-beta2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('3c917978c154070116f94a5858b7b453f15491dda6f615a8f91d8f813474137e')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
