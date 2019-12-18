# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibmq-provider
pkgname=python-${_pkgname}
pkgver=0.4.5
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
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('44fbd98fb99566bc20b25718214c47a1c323c9bb02e4bedc433f050de3564332')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
