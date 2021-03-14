# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-terra
pkgname=python-${_pkgname}
pkgver=0.16.4
pkgrel=1
pkgdesc="An open-source framework for working with noisy quantum computers at the level of pulses, circuits, and algorithms"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-terra"
license=('Apache')
depends=(
    'cython'
    'python-jsonschema'
    'python-marshmallow'
    'python-marshmallow-polyfield'
    'python-networkx'
    'python-retworkx'
    'python-numpy'
    'python-ply'
    'python-psutil'
    'python-scipy'
    'python-sympy'
    'python-dill'
    'python-fastjsonschema'
    'python-constraint'
)
optdepends=(
    'python-matplotlib: plotting support'
    'python-qiskit-aer: high performance simulator framework'
    'python-qiskit-ignis: noise framework'
    'python-qiskit-aqua: algorithms for quantum computing applications'
    'python-qiskit-ibmq: IBM Q account support'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4b9344bd5f49ba8617f55d84633e22616001aca9072b58fb6b91ab0ffa28760c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
