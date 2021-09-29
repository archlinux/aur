# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-scrape-schema-recipe
_pkgname=scrape-schema-recipe
pkgver=0.2.0
pkgrel=1
pkgdesc="Scrapes food recipes from HTML into Python dictionaries"
arch=('any')
url="https://github.com/micahcochran/scrape-schema-recipe"
license=('Apache')
depends=('python-dataclasses' 'python-extruct' 'python-importlib_resources' 'python-isodate' 'python-requests' 'python-typeshed-git')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ecc253c82a9346c66e77005680a3f746a2feca7292bbcab0c4357b2757a0d1bf')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
