# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgbase=python-${_pypi_name}
#pkgname=(python-${_pypi_name} python2-${_pypi_name})
pkgname=$pkgbase
pkgver=0.470
pkgrel=1
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang')
conflicts=('python-mypy-lang')
depends=('python-typed-ast')
source=("https://github.com/python/mypy/archive/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    python setup.py install --root="${pkgdir}" --optimize=1
}
sha256sums=('e17506ff9d6b011896187dadd30cb5905bc3129737b5ef67e0a506f8655ce686')
