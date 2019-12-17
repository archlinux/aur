# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aqua
pkgname=python-${_pkgname}
pkgver=0.6.2
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aqua"
license=('Apache')
depends=('python-qiskit-terra'
         'python-qiskit-ignis'
         'python-scikit-learn'
         'python-cvxopt'
         # dlx docplex
         'python-fastdtw'
         'python-quandl'
         'python-h5py'
         'python-pyscf')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d91106b6f8061d0b5bea8839b0547b387c26b55d93ff18abab29c9f07fd3d41b')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
