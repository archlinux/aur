# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zcatalog
_pkgname=Products.ZCatalog
pkgver=5.0.3
pkgrel=1
pkgdesc="Zope's indexing and search solution"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2a6a7b72ca4210321add3adc9780aa5d781177fe9bdaf313d75d0b6752d13a8d')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
