# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.11.0rc0
pkgrel=1
pkgdesc="Lavalink client library used in Red-DiscordBot"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python-discord' 'python-red-commons')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('59116b7b260472c76e6d40542a2c85fc099857de280954f52b69e7b9a51eba40')

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
