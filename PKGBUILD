# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=0.34.2
pkgrel=1
pkgdesc="An open-source SDK for working with quantum computers at the level of circuits, algorithms, and application modules"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'python-qiskit-aer'
    'python-qiskit-ibmq-provider'
    'python-qiskit-ignis'
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
sha256sums=('07e1e24ce08860e0b05e2b61a3752f79f907ba7f293bf2c591fa44466823504e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
