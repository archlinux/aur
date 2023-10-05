# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodbpickle
_pkgname=zodbpickle
pkgver=3.1
pkgrel=1
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/${_pkgname}"
license=('ZPL')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6304748069275bc7cb4ab492aab11ca4421986f9b058cc45517dc3ca619b629c')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
