# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca_py
pkgver=0.40.1
pkgrel=1
_subfolder=6f/6e/6d4e85d1d9f7bd1695587adfb87ef17ba1068972b235bae4bfb6eba6a22b
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-poetry-dynamic-versioning' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/${_subfolder}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('188adcbb7c140d6f9eebe04011a0df68e1540374e2940098f032b8f21ff34bf3')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
