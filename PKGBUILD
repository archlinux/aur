# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=0.25.3
pkgrel=2
pkgdesc="An open-source SDK for working with quantum computers at the level of circuits, algorithms, and application modules"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'python-qiskit-aer'
    'python-qiskit-ibmq-provider'
    'python-qiskit-ignis'
    'python-qiskit-aqua'
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
sha256sums=('985cbd876fafea91d97a730e6624c2a149a76bb97811e2e93146181e06800388')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
