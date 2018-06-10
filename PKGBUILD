# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodb
_pkgname=ZODB
pkgver=5.4.0
pkgrel=1
pkgdesc="A native object database for Python"
arch=(any)
url="http://www.zodb.org/en/latest/index.html"
license=('ZPL')
depends=('python' 'python-persistent' 'python-zodbpickle' 'python-transaction' 'python-zcatalog' 'python-btreefolder2')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d77f343efb28831c1be4b405c158cc5e56d228b90a9e7acd42f8f6287459f30c')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
