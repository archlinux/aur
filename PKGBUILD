# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.7.0
pkgrel=1
pkgdesc="Implements JSON-RPC 2.0 Specification using aiohttp"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python' 'python-aiohttp' 'python-discord')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c46a650d4d1cce710e3f7e853856dd050708b6e54994673ef3c0365b72c47811')

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
