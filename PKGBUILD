# Maintainer: hexchain <i at hexchain dot org>

_name=PyQt5-stubs
pkgname=python-pyqt5-stubs
pkgver=5.15.6.0
pkgrel=3
pkgdesc='PEP561 stub files for the PyQt5 framework'
url="https://github.com/python-qt-tools/PyQt5-stubs"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('GPL-3.0-only')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-qt-tools/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81a2efcbb187b553dbb057d38fa671a130781cbb037b5132d8f4fdb75f3f6eff')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
