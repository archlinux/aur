# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zcatalog
_pkgname=Products.ZCatalog
pkgver=6.0
pkgrel=1
pkgdesc="Zope's indexing and search solution"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('86e95ad0cc8f7601f47cb5bbab8bd3b9ee48b80083911750b900af3a7b2ac63c')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
