# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-scrape-schema-recipe
_pkgname=scrape-schema-recipe
pkgver=0.2.2
pkgrel=1
pkgdesc="Scrapes food recipes from HTML into Python dictionaries"
arch=('any')
url="https://github.com/micahcochran/scrape-schema-recipe"
license=('Apache')
depends=('python-dataclasses'
    'python-extruct'
    'python-importlib_resources'
    'python-isodate'
    'python-requests'
    'python-types-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aa4004fedb52019d9d627944b03966412b3dda8a96df06c0715aa0889af07216')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
