# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.6.0
pkgrel=1
pkgdesc="Implements JSON-RPC 2.0 Specification using aiohttp"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python' 'python-aiohttp' 'python-discord')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('dc79453d816ebdf44963285c8bcd6eb625f6682c8827c20f32ffaefb4b0a7dab')

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
