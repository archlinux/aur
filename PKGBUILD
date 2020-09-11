# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname='python-aresponses'
_pkgname='aresponses'
pkgver='2.0.0'
pkgrel=1
pkgdesc="An asyncio testing server for mocking external services"
arch=('x86_64')
url="https://github.com/circleup/aresponses"
license=('MIT')
depends=('python>=3.6.0')
makedepends=('tar' 'python-aiohttp>=3.1.0' 'python-pytest-asyncio' 'python-setuptools')
source=("$pkgname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/3c/12/9fd8dba9f7a1e48deb00df0b66944f709da58114d90d7f88c1b99c509d9a/$_pkgname-$pkgver.tar.gz")
sha256sums=('58693a6b715edfa830a20903ee1d1b2a791251923f311b3bebf113e8ff07bb35')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
