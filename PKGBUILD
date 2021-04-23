# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api-git
_pkgname=vk_api
pkgver=11.9.1.r2.d49c1dc
pkgrel=1
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
arch=('any')
url='https://github.com/python273/vk_api'
license=('APACHE')
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
makedepends=(python-setuptools)
source=('git://github.com/python273/vk_api')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
  	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="${pkgdir}/" --optimize=1 
}
# vim:set ts=4 sw=4 noet:
