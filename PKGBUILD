# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgname=${_pypi_name}
pkgver=0.511
pkgrel=1
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang' 'python-mypy')
conflicts=('python-mypy-lang' 'python-mypy')
depends=('python-typed-ast')
source=(
    "$_pypi_name-$pkgver.tar.gz::https://pypi.org/packages/source/m/$_pypi_name/$_pypi_name-$pkgver.tar.gz"
    "LICENSE::$url/raw/v$pkgver/LICENSE")

package() {
    cd "$srcdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
sha256sums=('3ff4d75116c8fd182440f769dea98e07438def93b0685bf3893511f84df4aeee'
            '7b4fa59b4ecaaa5fe29d75802394b5c5ccfea2c52a6cb7693bd8512f7117e691')
