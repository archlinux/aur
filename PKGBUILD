# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodb
_pkgname=ZODB
pkgver=5.5.0
pkgrel=1
pkgdesc="A native object database for Python"
arch=(any)
url="http://www.zodb.org/en/latest/index.html"
license=('ZPL')
depends=('python' 'python-persistent' 'python-zodbpickle' 'python-transaction' 'python-zcatalog')
optdepends=('python-btreefolder2')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('dcbc8c9b8330fc2807655d076749c96af0209fecf361edf102eb83784cc4494a')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
