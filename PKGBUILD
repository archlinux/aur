# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aqua
pkgname=python-${_pkgname}
pkgver=0.9.5
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models (DEPRECATED)"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aqua"
license=('Apache')
depends=(
    'python-cvxopt'
    'python-dlx'
    'python-docplex'
    'python-fastdtw'
    'python-h5py'
    'python-pandas'
    'python-psutil'
    'python-pyscf'
    'python-qiskit-ignis'
    'python-qiskit-terra'
    'python-quandl'
    'python-retworkx'
    'python-scikit-learn'
    'python-yfinance'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ee13338192145742c9116501fa0ebb3b930f7e4d3fdc8c04a5199d7a602f2bf8')
install="${pkgname}.install"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
