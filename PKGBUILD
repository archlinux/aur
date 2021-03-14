# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=0.24.0
pkgrel=1
pkgdesc="An open-source SDK for working with quantum computers at the level of circuits, algorithms, and application modules"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit"
license=('Apache')
depends=(
    'python-qiskit-terra=0.16.4'
    'python-qiskit-aer=0.7.6'
    'python-qiskit-ibmq-provider=0.12.1'
    'python-qiskit-ignis=0.5.2'
    'python-qiskit-aqua=0.8.2'
)
optdepends=(
    'python-matplotlib: plotting support'
    'python-ipywidgets'
    'python-pydot'
    'python-pillow'
    'python-pylatexenc'
    'python-seaborn'
    'python-pygments'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f550fb4ee0fb142836257d67ef58fa4394afc899567d7a4eab7a3a2a751645e1')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
