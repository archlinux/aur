# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodbpickle
_pkgname=zodbpickle
pkgver=2.4
pkgrel=1
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('85f17bdc5a491fc5c920c93a7442c8799776c90b884aaca3840a3cc4140b8a07')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
