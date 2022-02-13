# Maintainer: monosans

pkgname=python-vkwave
_pkgname=vkwave
pkgver=0.2.14
pkgrel=1
pkgdesc="Framework for building high-performance & easy to scale projects interacting with VK's API"
url=https://github.com/fscdev/vkwave
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(
		python
		python-pydantic
		python-typing_extensions
		python-aiohttp)
optdepends=('python-aioredis: storage-redis')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e35528b488697aaefd154beaee573d2ce07ff4e20bb00484ba7a7f3ee5c39f79')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
