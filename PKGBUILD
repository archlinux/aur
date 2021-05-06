# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-terra
pkgname=python-${_pkgname}
pkgver=0.17.2
pkgrel=1
pkgdesc="An open-source framework for working with noisy quantum computers at the level of pulses, circuits, and algorithms"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-terra"
license=('Apache')
depends=(
    'cython'
    'python-constraint'
    'python-dateutil'
    'python-dill'
    'python-fastjsonschema'
    'python-jsonschema'
    'python-numpy'
    'python-ply'
    'python-psutil'
    'python-retworkx'
    'python-scipy'
    'python-sympy'
)

optdepends=(
    'python-matplotlib: plotting support'
    'python-qiskit-aer: high performance simulator framework'
    'python-qiskit-ignis: noise framework'
    'python-qiskit-aqua: algorithms for quantum computing applications'
    'python-qiskit-ibmq-provider: IBM Q account support'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2f001f4a2778ec9de7d9a9fecdd8592dfedfa34f2cdee1799f66de1bc0c91db2')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
