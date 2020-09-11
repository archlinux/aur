# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname='python-aresponses'
_pkgname='aresponses'
pkgver='2.0.0'
pkgrel=2
pkgdesc="An asyncio testing server for mocking external services"
arch=('x86_64')
url="https://github.com/circleup/aresponses"
license=('MIT')
depends=('python>=3.6.0')
makedepends=('tar' 'python-aiohttp>=3.1.0' 'python-pytest-asyncio' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('58693a6b715edfa830a20903ee1d1b2a791251923f311b3bebf113e8ff07bb35')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	cd ../../
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
