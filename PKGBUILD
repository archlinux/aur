# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibmq-provider
pkgname=python-${_pkgname}
pkgver=0.12.3
pkgrel=1
pkgdesc="Module for accessing the quantum devices and simulators at IBMQ"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ibmq-provider"
license=('Apache')
depends=(
    'python-dateutil'
    'python-nest_asyncio'
    'python-numpy'
    'python-qiskit-terra'
    'python-requests'
    'python-requests-ntlm'
    'python-urllib3'
    'python-websockets'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fede8ee87893d3ca56ab10bd3f4ab50961fb44064b2610aff975ea7bc1b12cc4')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
