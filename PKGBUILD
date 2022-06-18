# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-runtime
pkgname=python-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="IBM Client for Qiskit Runtime"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ibm-runtime"
license=('Apache')
depends=(
    'python-dateutil'
    'python-ibm-platform-services'
    'python-numpy'
    'python-qiskit-terra'
    'python-requests'
    'python-requests-ntlm'
    'python-typing_extensions'
    'python-urllib3'
    'python-websocket-client'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('83b9cc2edfeff8a3a7be3e7d8845d5941adebbf961412672d33b3b722787c12021cfa1cb0cff340745321669156266bec8bd0df60b2a7f0ff8175db6d037134c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
