# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_pkgname=aiohttp-zlib-ng
pkgname=python-aiohttp-zlib-ng
pkgver=0.2.0
pkgrel=1
pkgdesc="Enable zlib_ng on aiohttp"
arch=(any)
url="https://github.com/bdraco/aiohttp-zlib-ng"
license=('Apache-2.0')
depends=('python-aiohttp' 'python-isal')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ea9268ed926e4d8b44bfe5e367af44f0134ee9b939a5ef0e91506f1897a0d4b8')

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

