# Maintainer: monosans

pkgname=python-vkbottle
_pkgname=vkbottle
pkgver=4.2.1
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
sha256sums=('09256ec24debfb75ecbb172017e242790e0d42053af63490e30ab6c07bec19d8')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
