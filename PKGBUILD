# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

_name=tslearn
pkgname=python-${_name,,}
pkgver=0.7.0
pkgrel=1
pkgdesc='A machine learning toolkit dedicated to time-series data'
arch=('any')
url="https://github.com/tslearn-team/tslearn"
license=('BSD-2-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba' 'python-joblib' 'python-tensorflow')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(2598920b60e374ea7d890f2e3b39aa13c7ec77417b7691dcb38ef9ca74545a14)
makedepends=(python-build python-installer python-wheel)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
