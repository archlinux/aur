# Maintainer: monosans

pkgname=python-vkbottle
_pkgname=vkbottle
pkgver=4.2.0
pkgrel=1
pkgdesc='Customizable asynchronous VK API framework'
url=https://github.com/vkbottle/vkbottle
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(
		python
		python-aiohttp
		python-choicelib
		python-pydantic
		python-vbml
		python-vkbottle-types
		python-watchdog
		python-aiofiles
		python-typing_extensions)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a41806204402175e8d8af62b2d21a94c132befc62c0c574ff2abdccd1135e96f')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
