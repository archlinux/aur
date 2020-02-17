# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zcatalog
_pkgname=Products.ZCatalog
pkgver=5.0.4
pkgrel=1
pkgdesc="Zope's indexing and search solution"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b262e799a44a2f1af2c23e0896cb327efd3ca31eeae4ba731e931718e0f4106f')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
