# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=swiglpk
pkgname="python-${_name}"
pkgver=5.0.11
pkgrel=1
pkgdesc='A Python interface to the GLPK optimization solver'
arch=(any)
url='https://github.com/biosustain/swiglpk'
license=(GPL-3.0-or-later)
depends=(python glpk)
makedepends=(swig python-setuptools python-build python-installer python-wheel)
conflicts=(python-swiglpk-git)
source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")
sha256sums=('04f1832b54c8faa2c6b2acb475c540d213486d8c425e42c9b3c40022ebb87a01')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
