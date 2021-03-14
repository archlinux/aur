# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibmq-provider
pkgname=python-${_pkgname}
pkgver=0.12.1
pkgrel=1
pkgdesc="Module for accessing the quantum devices and simulators at IBMQ"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ibmq-provider"
license=('Apache')
depends=(
    'python-nest_asyncio'
    'python-qiskit-terra'
    'python-requests'
    'python-requests-ntlm'
    'python-websockets'
    'python-urllib3'
    'python-dateutil'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('15060258b1034dc5f73bb5ca4ac05e41492279ab3e6f489809cb9903309f0c72')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
