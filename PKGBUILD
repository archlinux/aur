# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction (DEPRECATED)"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('289d9877eb3d3bbf9542490a4fe79ce905ae0758aee88db9cc37a6b4a18f9d63d3b429700b54d5bfb3c1e0290f8948159bad2963d9aff72087d945768e0c89a9')
install="${pkgname}.install"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
