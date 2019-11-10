# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodbpickle
_pkgname=zodbpickle
pkgver=1.1
pkgrel=1
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('48acd7a3d4f3f4983e9034f173078b2972c7905f5c00bc4e9c8c3caff8629f38')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
