# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=0.23.1
pkgrel=1
pkgdesc="An open-source SDK for working with quantum computers at the level of circuits, algorithms, and application modules"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit"
license=('Apache')
depends=(
    'python-qiskit-terra=0.16.1'
    'python-qiskit-aer=0.7.1'
    'python-qiskit-ibmq-provider=0.11.1'
    'python-qiskit-ignis=0.5.1'
    'python-qiskit-aqua=0.8.1'
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
sha256sums=('86ae4324db338d70ea3a8e9f1000b839d73161a95bedf39810f1a891a8d8170e')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
