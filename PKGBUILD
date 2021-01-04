# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=aiohttp-json-rpc
pkgname="python-$_pkgname"
pkgver=0.13.3
pkgrel=1
pkgdesc="Implements JSON-RPC 2.0 Specification using aiohttp"
arch=(any)
url="https://github.com/pengutronix/aiohttp-json-rpc"
license=('Apache')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-django')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d8c7f39bedb7dfe84f9a813b383c8327b4d672b1b0c001a71e51e47045c10f7')

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
