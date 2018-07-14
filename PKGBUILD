# Maintainer: Michiel Brentjens <m.a.brentjens@gmail.com>
pkgname=python-pyxb
pkgver=1.2.6
pkgrel=2
pkgdesc="Generates Python code for classes that correspond to data structures defined by XMLSchema"
arch=(any)
url="http://pyxb.sourceforge.net/"
license=('Apache')
depends=('python')
makedepends=('python' 'python-setuptools')

source=("https://pypi.python.org/packages/source/P/PyXB/PyXB-$pkgver.tar.gz")
sha256sums=('2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4')

build() {
    cd "$srcdir/PyXB-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/PyXB-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
