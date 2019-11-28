# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aqua
pkgname=python-${_pkgname}
pkgver=0.6.1
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
sha256sums=('1896725155aaecdfea63cc30532b87585b3d1c4238a760b6f6f1ae49d2a23ae4')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
