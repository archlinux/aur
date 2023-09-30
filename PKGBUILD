# Maintainer: hexchain <i at hexchain dot org>

_pypiname=PyQt5-stubs
pkgname=python-pyqt5-stubs
pkgver=5.15.6.0
pkgrel=2
pkgdesc='PEP561 stub files for the PyQt5 framework'
url="https://github.com/python-qt-tools/PyQt5-stubs"
makedepends=('python-pip' 'python-setuptools')
license=('GPL3')
arch=('any')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('91270ac23ebf38a1dc04cd97aa852cd08af82dc839100e5395af1447e3e99707')

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
