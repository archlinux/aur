# Maintainer: monosans

pkgname=python-vkbottle
_pkgname=vkbottle
pkgver=4.1.10
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
sha256sums=('1ca32e07799604b5dee548abefd956a9bebc3591720bd98b08963bbcf42e99af')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
