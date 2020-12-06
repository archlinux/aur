# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.7.1
pkgrel=2
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aer"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'cython'
    'openblas'
    'pybind11')
optdepends=(
    'thrust: Parallelization (GPU/CPU) support'
    'cuda: Parallelization with CUDA (NVIDIA)'
    'openmp: Parallelization with OpenMP'
    'intel-tbb: Parallelization with Intel TBB')
makedepends=(
    'python-setuptools'
    'conan'
    'cmake'
    'python-scikit-build')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('816e0adaef2a5b89f0efa10c8b947815dbb09cbdbc0ad55282e08d07dcc99436')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
