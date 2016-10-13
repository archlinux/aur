# Maintainer: icasdri <icasdri at gmail dot com>

_pypi_name=mypy-lang
pkgname=python-${_pypi_name}
pkgver=0.4.5
pkgrel=1
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
source=("https://pypi.io/packages/source/${_pypi_name:0:1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
sha256sums=('2e203f945356def5f984d93a826eefe7e78e6fd542e47234d9ff141b4b363674')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
