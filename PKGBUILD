# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=swiglpk
pkgname="python-${_name}"
pkgver=5.0.12
pkgrel=1
pkgdesc='A Python interface to the GLPK optimization solver'
arch=(any)
url='https://github.com/biosustain/swiglpk'
license=(GPL-3.0-or-later)
depends=(python glpk)
makedepends=(swig python-setuptools python-build python-installer python-wheel)
conflicts=(python-swiglpk-git)
source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")
sha256sums=('3f629807740b8accc09f2618a39ce0c7f9391371519c1eee267166932ccf59d7')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
