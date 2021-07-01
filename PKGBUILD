_pkgname=sqlite-fts4
pkgname=python-${_pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python functions for working with SQLite FTS4 search"
arch=("any")
url="https://github.com/simonw/sqlite-fts4"
license=("Apache")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("b2d4f536a28181dc4ced293b602282dd982cc04f506cf3fc491d18b824c2f613")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
