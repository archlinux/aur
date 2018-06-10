# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-btreefolder2
_pkgname=Products.BTreeFolder2
pkgver=4.0.0
pkgrel=1
pkgdesc="A BTree based implementation for Zope's OFS"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d1fa39b3c2ade31be49cef845f4f0b473253712bb084346b0ca354cebc91e892')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
