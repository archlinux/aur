# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=methodtools
pkgname=python-methodtools
pkgver=0.4.5
pkgrel=1
pkgdesc="Expand functools features to methods, classmethods, staticmethods."
url="https://pypi.python.org/pypi/methodtools/"
depends=('python' 'python-wirerope')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/youknowone/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('63465330086740da27d06397bafe18fb6569553ebfff6dcffb1398b1ca305a4a')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHONPATH=./build/lib pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
