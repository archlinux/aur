# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.4
pkgrel=1
pkgdesc="Tools for building and solving models of quantum systems in Qiskit"
arch=('any')
url="https://github.com/Qiskit-Extensions/qiskit-dynamics"
license=('Apache-2.0')
depends=(
    'python-matplotlib'
    'python-multiset'
    'python-numpy'
    'python-qiskit'
    'python-scipy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit-Extensions/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4d03d71980a49f678dd9224ff429f0ca3456805bdb649be77665e8b5693e9095b2d01647dbcce8c717f4638f904236827a80d63640bf994574038527c2ae6a1d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
