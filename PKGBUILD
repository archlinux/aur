# Maintainer: monosans

pkgname=python-vkbottle
_pkgname=vkbottle
pkgver=4.1.13
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
sha256sums=('0e1925180b42283265f0a99daa44a46f1124e07681366667226b609943f52bfb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
