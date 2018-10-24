# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-btreefolder2
_pkgname=Products.BTreeFolder2
pkgver=4.1
pkgrel=1
pkgdesc="A BTree based implementation for Zope's OFS"
arch=(any)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d94b229b476e7c0788df28f14b5213a30f8a5c7c7c954fd2a7a05f0618976d1d')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
