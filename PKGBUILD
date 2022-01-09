# Maintainer: monosans

pkgname=python-vkwave
_pkgname=vkwave
pkgver=0.2.13
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
sha256sums=('b5a6a59de6891cd272de568b119392476d2e64229835eb73514a19f009e6ebcc')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
