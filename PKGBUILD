# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.7.2
pkgrel=1
pkgdesc="Lavalink client library used in Red-DiscordBot"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python' 'python-aiohttp' 'python-discord')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2a3b3219dd767d0ffa5960e7b455c9cc29695400dd2b8da62c7f5a42c5aa2107')

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
