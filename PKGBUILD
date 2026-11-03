# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-matdeeplearn
_pkgname=MatDeepLearn_dev
pkgver=0.0.1
pkgrel=1
pkgdesc="GNN package for materials chemistry (Fung Lab, Georgia Tech)"
arch=('any')
url="https://github.com/Fung-Lab/MatDeepLearn_dev"
license=('MIT')
depends=(
    'python-pytorch'
    'python-torch-geometric'
    'python-numpy'
    'python-scipy'
    'python-ase'
    'python-pymatgen-core'
    'python-scikit-learn'
    'python-matplotlib'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Fung-Lab/MatDeepLearn_dev/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}-main"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-main"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
}
