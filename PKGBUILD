# Maintainer: monosans

pkgname=python-vkbottle
_pkgname=vkbottle
pkgver=4.1.11
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
		python-watchdog)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9e49f084ed7970646c562322d9f2046a82a722a9e0c3a2c2308e83aade14ce89')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
