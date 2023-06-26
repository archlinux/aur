# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca-py
pkgver=0.8.0
pkgrel=1
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-setuptools' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/4c/ed/00f8d479aa29602c849dd2852872ab2b3d4b676a9b4f2a0587d80a1bb618/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8344f74d76cac660451c31d9f2a7afbb6d99d7a88681c24ebeeeabd19bef3744')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
