# Maintainer: hexchain <i at hexchain dot org>

_pypiname=PyQt5-stubs
pkgname=python-pyqt5-stubs
pkgver=5.14.2.2
pkgrel=1
pkgdesc='PEP561 stub files for the PyQt5 framework'
url="https://github.com/stlehmann/PyQt5-stubs"
makedepends=('python-pip')
license=('GPL3')
arch=('any')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('b1a84b12bbeed74d95cc7fb4fd2df0a6711bd43e9a2651e552c83930c7b81638')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py test
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
