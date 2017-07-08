# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-asyncio_redis"
_name=asyncio_redis
pkgver=0.14.3
pkgrel=1
pkgdesc="PEP 3156 implementation of the redis protocol."
arch=("any")
url="https://pypi.python.org/pypi/asyncio_redis"
license=("2 clause BSD")
depends=("python")
makedepends=("python-distribute")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fae40dc59c7268dfb9a44542cb3f48a885c8f5f7438b13f0dfec1fbd10a82369')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
