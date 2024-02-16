# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodbpickle
_pkgname=zodbpickle
pkgver=3.2
pkgrel=1
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL-2.1 AND PSF-2.0')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8ce9f50be9af02a01703974912ea36a6de416afdce2b59c0a2d91968a53515df')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
