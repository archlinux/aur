# Maintainer: icasdri <icasdri at gmail dot com>

_pypi_name=mypy-lang
pkgbase=python-${_pypi_name}
#pkgname=(python-${_pypi_name} python2-${_pypi_name})
pkgname=$pkgbase
pkgver=0.4.6
pkgrel=1
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
optdepends=('python-typed-ast')
source=("https://pypi.io/packages/source/${_pypi_name:0:1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
sha256sums=('65322cf3466282947184271792b9f63153872896e958047708d8927864f4fb19')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
