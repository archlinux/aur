# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api-git
_pkgname=vk_api
pkgver=11.9.4
pkgrel=1
pkgdesc='vk.com API wrapper'
url=https://github.com/python273/vk_api
arch=(any)
license=(APACHE)
makedepends=(python-setuptools)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
provides=(python-vk_api)
conflicts=(python-vk_api)
source=(git+https://github.com/python273/vk_api)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=4 sw=4 noet:
