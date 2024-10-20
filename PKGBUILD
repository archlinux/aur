# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=qics
pkgname="python-${_name}"
pkgver=0.1.1
pkgrel=1
pkgdesc='The quantum information conic solver'
arch=(any)
url='https://qics.readthedocs.io'
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://github.com/kerry-he/qics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('79ca219778e9b2ae3f067cc4600bdf14d201703564564ec0121d753847ba06f9')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
