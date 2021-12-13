# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=docplex
pkgname=python-docplex
pkgver=2.22.213
pkgrel=2
pkgdesc="The IBM Decision Optimization CPLEX Modeling for Python"
arch=('x86_64')
url="https://pypi.org/project/docplex/"
license=('Apache')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8a86bba42b5b65f2e0f88ed350115efeb783b444661e2cfcf3a67d5c59bcb0bd')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
