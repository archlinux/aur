# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgbase=python-${_pypi_name}
pkgname=$pkgbase
pkgver=0.471
pkgrel=3
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang')
conflicts=('python-mypy-lang')
depends=('python-typed-ast-0.6.x')
source=(
    "$_pypi_name-$pkgver.tar.gz::https://pypi.org/packages/source/m/$_pypi_name/$_pypi_name-$pkgver.tar.gz"
    "LICENSE::https://github.com/python/mypy/raw/v0.471/LICENSE")

package() {
    cd "$srcdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
sha256sums=('552821e4ae601e9058797cfc7d251ff6a2789b5b5aeb00df017f76271d726e9f'
            '7b4fa59b4ecaaa5fe29d75802394b5c5ccfea2c52a6cb7693bd8512f7117e691')
