# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-terra
pkgname=python-${_pkgname}
pkgver=0.10.0
pkgrel=1
pkgdesc="An open-source framework for working with noisy quantum computers at the level of pulses, circuits, and algorithms"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-terra"
license=('Apache')
conflicts=('python-qiskit-sdk-git'
           'python-qiskit-api-git')
depends=('python-jsonschema'
         'python-marshmallow'
         'python-marshmallow-polyfield'
         'python-networkx'
         'python-numpy'
         'python-ply'
         'python-psutil'
         'python-scipy'
         'python-sympy'
         'python-dill')
optdepends=('python-matplotlib: plotting support'
            'python-qiskit-aer: high performance simulator framework'
            'python-qiskit-ignis: noise framework'
            'python-qiskit-aqua: algorithms for quantum computing applications'
            'python-qiskit-ibmq: IBM Q account support')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('be5f65ac2c3366512e722f09af69d1552453c30ea925d20c2247cb6b5f88daaf')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}