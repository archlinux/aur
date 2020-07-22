# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.1-beta2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('c8d74aa275d0ec70ac53c60c58cf2d6fe161e7fc8e39c2fc88f9e3d05aee7a71')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
