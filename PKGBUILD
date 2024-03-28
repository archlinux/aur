# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-scrape-schema-recipe
_pkgname=scrape-schema-recipe
pkgver=0.2.2
pkgrel=2
pkgdesc="Scrapes food recipes from HTML into Python dictionaries"
arch=("any")
url="https://github.com/micahcochran/scrape-schema-recipe"
license=("Apache-2.0")
depends=(python-extruct python-isodate python-requests)
makedepends=(python-setuptools)
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
