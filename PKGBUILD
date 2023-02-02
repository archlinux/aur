# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-btreefolder2
_pkgname=Products.BTreeFolder2
pkgver=5.0
pkgrel=1
pkgdesc="A BTree based implementation for Zope's OFS"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a970cd75eaa5cc63cb66a9f7f756febffad95ad8aeb7cc0257b29acf4e0ccc94')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
