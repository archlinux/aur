# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibmq-provider
pkgname=python-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Module for accessing the quantum devices and simulators at IBMQ"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ibmq-provider"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'python-nest_asyncio'
    'python-requests'
    'python-requests-ntlm'
    'python-websockets'
    'python-urllib3'
    'python-dateutil'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4e671b0e427ac8e88f596f5985f44f5755467230140bfc71312f983c153047c2')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
