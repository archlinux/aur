# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rmrl
pkgver=0.1.2
pkgrel=1
pkgdesc="reMarkable Rendering Library"
arch=(any)
url="https://github.com/rschroll/rmrl/"
license=('GPL')
depends=('python-pdfrw' 'python-reportlab' 'python-pyxdg' 'python-svglib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmrl/rmrl-$pkgver.tar.gz")
sha256sums=('8c8e757af5ca3eb7475f56803f7f37256fe4c5cad3a9ea5ad7534b2ebd172447')

build() {
    cd "$srcdir"/rmrl-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/rmrl-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
