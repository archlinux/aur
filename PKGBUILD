# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-btreefolder2
_pkgname=Products.BTreeFolder2
pkgver=4.2
pkgrel=1
pkgdesc="A BTree based implementation for Zope's OFS"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4631c50ed7ce4828a27983baf6440994bad6bd322ad0845e55f26c57788610d6')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
