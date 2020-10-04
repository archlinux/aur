# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=aiohttp-json-rpc
pkgname="python-$_pkgname"
pkgver=0.13.2
pkgrel=1
pkgdesc="Implements JSON-RPC 2.0 Specification using aiohttp"
arch=(any)
url="https://github.com/pengutronix/aiohttp-json-rpc"
license=('Apache')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-django')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ba383d761787a533c3ceb71cf0d22b883bccc5824e45168897e727c474e8fc7')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pkgname-$pkgver"
	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
