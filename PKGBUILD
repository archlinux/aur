# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=nfcpy
pkgname=python-${_pkgname}
pkgver=1.0.3
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('03ea8a47d2dfe92bdc41d0751fba2b124793936f1fe7d5096dbb0fdfad5e635a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
