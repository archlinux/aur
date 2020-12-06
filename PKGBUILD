# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aqua
pkgname=python-${_pkgname}
pkgver=0.8.1
pkgrel=2
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aqua"
license=('Apache')
depends=('python-qiskit-terra'
         'python-qiskit-ignis'
         'python-scikit-learn'
         'python-cvxopt'
         'python-dlx'
         'python-docplex'
         'python-fastdtw'
         'python-quandl'
         'python-h5py'
         'python-pyscf'
         'python-pandas'
         'python-yfinance'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5cf1ed50eb35d3150c5d2f4977420ae5dee822ac50c5375eb81c7d033110931c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
