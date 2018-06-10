# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zcatalog
_pkgname=Products.ZCatalog
pkgver=4.1
pkgrel=1
pkgdesc="Zope's indexing and search solution"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bb7f54406680812d2135831e777afa421ad6d032a238cd6b0d70e3e0d0cc0ca0')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
