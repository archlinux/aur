# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multitasking
pkgname=python-multitasking
pkgver=0.0.10
pkgrel=1
pkgdesc="Non-blocking Python methods using decorators"
arch=('x86_64')
url="https://github.com/ranaroussi/multitasking"
license=('Apache')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('810640fa6670be41f4a712b287d9307a14ad849d966f06a17d2cf1593b66c3cd')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
