# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodb
_pkgname=ZODB
pkgver=5.8.0
pkgrel=1
pkgdesc="A native object database for Python"
arch=(any)
url="http://www.zodb.org/en/latest/index.html"
license=('ZPL')
depends=('python' 'python-persistent' 'python-zodbpickle' 'python-transaction' 'python-zcatalog')
optdepends=('python-btreefolder2')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('28dba00ef626de10589ededab85ad0f0edf72925e75d36a15c99c63ac05fe764')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
