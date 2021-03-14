# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=docplex
pkgname=python-docplex
pkgver=2.20.204
pkgrel=1
pkgdesc="The IBM Decision Optimization CPLEX Modeling for Python"
arch=('x86_64')
url="https://pypi.org/project/docplex/"
license=('Apache')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('24d8c3f54b4b1ec306c13b97c9d67e2f9fa93d0d9ea1b92bdba62df6982cd6a0')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
