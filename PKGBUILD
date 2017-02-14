# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgbase=python-${_pypi_name}
#pkgname=(python-${_pypi_name} python2-${_pypi_name})
pkgname=$pkgbase
pkgver=0.471
pkgrel=1
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang')
conflicts=('python-mypy-lang')
depends=('python-typed-ast')
source=("$_pypi_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    python setup.py install --root="${pkgdir}" --optimize=1
}
sha256sums=('e97042b125bd81b30577416f5ab1be4cc1db4793e00032f13fbc388d25132f6f')
