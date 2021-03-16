# Maintainer: hexchain <i at hexchain dot org>

_pypiname=PyQt5-stubs
pkgname=python-pyqt5-stubs
pkgver=5.15.2.0
pkgrel=1
pkgdesc='PEP561 stub files for the PyQt5 framework'
url="https://github.com/stlehmann/PyQt5-stubs"
makedepends=('python-pip')
license=('GPL3')
arch=('any')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('dc0dea66f02fe297fb0cddd5767fbf58275b54ecb67f69ebeb994e1553bfb9b2')

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
