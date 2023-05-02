# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-btreefolder2
_pkgname=Products.BTreeFolder2
pkgver=5.1
pkgrel=1
pkgdesc="A BTree based implementation for Zope's OFS"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4f0385cb2dca7e784e9522e8e3d85a34fdb2d81d2312b216ce92d606a175f9a4')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
