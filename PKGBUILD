# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multitasking
pkgname=python-multitasking
pkgver=0.0.9
pkgrel=1
pkgdesc="Non-blocking Python methods using decorators"
arch=('x86_64')
url="https://github.com/ranaroussi/multitasking"
license=('Apache')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b59d99f709d2e17d60ccaa2be09771b6e9ed9391c63f083c0701e724f624d2e0')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
