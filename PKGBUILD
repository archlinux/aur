# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca-py
pkgver=0.5.4
pkgrel=1
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-setuptools' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/bd/d1/8af3117a78258ce661924d2bbaae313d343716c67e15c421022f5465d2c3/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('53c16c61512bbafe68585dcede3ad357dfcef68ae8b98ccda415d0fd00be9d65')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
