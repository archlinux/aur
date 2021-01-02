# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.2-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('19a9d893124b0435dd46769eae4ee619badf86d0a1271481c93ab6b2c1e65c75')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
