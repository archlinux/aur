# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.7.1
pkgrel=1
pkgdesc="Lavalink client library used in Red-DiscordBot"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python' 'python-aiohttp' 'python-discord')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('64b24197705d9e79f92c20112d9e5e4f5e759f47db1de7628733141182f4e7b6')

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
