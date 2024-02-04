# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.5
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
b2sums=('57ebb437fdca18370b34f0c6bbb2e2ee7f07c80e31b69697db709a07d18bd1b22d50567632f4ced5df51c0e4ce56df8f15c3872fadab9db198d6a9caf0710af3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
