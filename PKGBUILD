# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_pkgname=aiohttp-fast-url-dispatcher
pkgname=python-aiohttp-fast-url-dispatcher
pkgver=0.3.0
pkgrel=1
pkgdesc="A faster URL dispatcher for aiohttp"
arch=(any)
url="https://github.com/bdraco/aiohttp-fast-url-dispatcher"
license=('Apache-2.0')
depends=('python-aiohttp')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov' 'python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b194f9fa973443c75c000b86ae7aa9134924ff6bfec168aee36367decf7f2bf7')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pkgname-$pkgver"
	pytest
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
