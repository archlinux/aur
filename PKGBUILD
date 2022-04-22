# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodbpickle
_pkgname=zodbpickle
pkgver=2.3
pkgrel=1
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e9da6a363a7484ed3e734ea9a6f1c87a385e6fba1d0add489b017071ba7423ec')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
