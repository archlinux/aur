# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-asyncio_redis"
_pkgname=asyncio_redis
pkgver=0.15.1
pkgrel=1
pkgdesc="PEP 3156 implementation of the redis protocol."
arch=("any")
url="https://pypi.python.org/pypi/asyncio_redis"
license=("BSD-2-Clause")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('067dbc251ab84d6e53ef8b33dbfd8afd62987ab08f72ca922f6870c96be53b54')

build() {
	cd "$_pkgname-$pkgver"
	python ./setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
