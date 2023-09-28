# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca_py
pkgver=0.11.0
pkgrel=1
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/8d/32/65f237ac2f301c4085f52d6a48a3a941924616347ce164b0efb08232c61a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2e1657671c80972ec9852051273e089d94e32104e922b5117a86347da9820a33')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
