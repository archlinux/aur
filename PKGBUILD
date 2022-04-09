# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zcatalog
_pkgname=Products.ZCatalog
pkgver=6.2
pkgrel=1
pkgdesc="Zope's indexing and search solution"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c6fd83e221ada691bb2e60b4061cd54e4164cefd17814a64c6d58a458f3cc882')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
