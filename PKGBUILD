# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgbase=python-${_pypi_name}
pkgname=$pkgbase
pkgver=0.471
pkgrel=2
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang')
conflicts=('python-mypy-lang')
depends=('python-typed-ast-0.6.x')
source=("$_pypi_name-$pkgver.tar.gz::https://pypi.org/packages/source/m/$_pypi_name/$_pypi_name-$pkgver.tar.gz")

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
sha256sums=('552821e4ae601e9058797cfc7d251ff6a2789b5b5aeb00df017f76271d726e9f')
