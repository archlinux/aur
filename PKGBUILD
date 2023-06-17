# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.11.0
pkgrel=1
pkgdesc="Lavalink client library used in Red-DiscordBot"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python-discord' 'python-red-commons')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9646a35433b51f953738f9e7e6faa5def753414740df8fb91f81271c1362b71a')

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
